from rest_framework import generics, permissions
from rest_framework.response import Response
from rest_framework import status
from knox.models import AuthToken
from .serializers import UserSerializer, RegisterSerializer, LoginSerializer, ProfileSerializer
from django.db import connection
from django.core.mail import send_mail

# Register API
class RegisterAPI(generics.GenericAPIView):
    
    serializer_class = RegisterSerializer

    def post(self, request, *args, **kwargs):
        
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user , key = self.perform_create(serializer)

        return Response({
            "user" : UserSerializer(user, context=self.get_serializer_context()).data,
            "token": AuthToken.objects.create(user)[1]
        })

    def perform_create(self, serializer):
        user = serializer.save()
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM simple_email_confirmation_emailaddress WHERE user_id = %s", [user.id])
            row = cursor.fetchone()

        subject = 'Welcome to ReadRecommend!'
        message = 'Hi there! Use %s to confirm your email address with ReadRecommend!' % row[2]
        recipients = [row[1]]
        send_mail(
            subject=subject,
            message=message,
            from_email=None,
            recipient_list=recipients,
            fail_silently=False
        )
        return user , row[2]

# Login API
class LoginAPI(generics.GenericAPIView):

    serializer_class = LoginSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data
        return Response({
            "user": UserSerializer(user, context=self.get_serializer_context()).data,
            "token": AuthToken.objects.create(user)[1]
        })


# Get User API
class UserAPI(generics.RetrieveAPIView):

    permission_classes = [
        permissions.IsAuthenticated,
    ]

    serializer_class = UserSerializer

    def get_object(self):
        return self.request.user

class ProfileAPI(generics.GenericAPIView):

    serializer_class = ProfileSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        try:
            profile, is_verified = self.perform_create(serializer)
            if(is_verified):
                return Response(
                    serializer.data, 
                    status=status.HTTP_201_CREATED, 
                )
            else:
                return Response(
                serializer.data, 
                status=status.HTTP_400_BAD_REQUEST, 
            )
        except:
            return Response(
                serializer.data, 
                status=status.HTTP_400_BAD_REQUEST, 
            )
    
    def perform_create(self, serializer):
        info = serializer.validated_data
        with connection.cursor() as cursor:
            cursor.execute("SELECT key FROM simple_email_confirmation_emailaddress WHERE user_id = %s", [info['user'].id])
            row = cursor.fetchone()
        if(row[0] == info['verification_code']):
            profile = serializer.save()
            return profile , True
        else:
            return None , False