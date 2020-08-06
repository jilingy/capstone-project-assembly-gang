from google.oauth2 import id_token
from google.auth.transport import requests
from rest_framework.response import Response
from rest_framework import status
from allauth.socialaccount.providers.google.views import GoogleOAuth2Adapter
from rest_auth.registration.views import SocialLoginView
from allauth.socialaccount.providers.oauth2.client import OAuth2Client
from .googleviews import GoogleAuthLogin
from rest_auth.registration.serializers import SocialLoginSerializer
from django.db import connection
from django.contrib.auth.models import User
from app.api.serializers import UserSerializer, CollectionSerializer
from django.contrib.auth.hashers import make_password
from app.models import Collections
from project import settings
from datetime import datetime
from django.utils import timezone
from django.db import transaction
import json

class GoogleLogin(SocialLoginView):

    adapter_class = GoogleAuthLogin
    client_class = OAuth2Client
    serializer_class = SocialLoginSerializer

    def post(self, request):
        requestJson = json.loads(request.body)
        request = requests.Request()

        id_info = id_token.verify_oauth2_token(requestJson['access_token'], request, settings.GOOGLE_CLIENT_ID)

        if id_info['iss'] not in ['accounts.google.com', 'https://accounts.google.com']:
            return Response("Unable to Validate User: Wrong Issuer")

        if not id_info:
            return Response("Unable to Validate User: Invalid Token")

        try:
            # If user exists, simply use that user and token to authenticate
            user = User.objects.get(email=id_info['email'])
            serializer = UserSerializer(user)
            return Response({
                "user": serializer.data,
                "token": requestJson['access_token'], 
                "exists": True,
            }, status=status.HTTP_200_OK)
        except:
            # If user does not exist, create it using details from google
            password = make_password('')
            user = User(
                first_name = id_info['given_name'],
                last_name = id_info['family_name'],
                last_login = datetime.now(),
                username = id_info['given_name'] + " " + id_info['family_name'],
                password = password,
                email = id_info['email']
            )
            user.save()
            serializer = UserSerializer(user)
            return Response({
                "user": serializer.data,
                "token": requestJson['access_token'],
                "exists": False
            }, status=status.HTTP_200_OK)