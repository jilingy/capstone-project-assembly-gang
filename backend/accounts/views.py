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
from app.api.serializers import UserSerializer
from project import settings
import datetime
import json

class GoogleLogin(SocialLoginView):
    
    callback_url = "https://127.0.0.1:8000/accounts/google/login/callback/"
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
            user = User.objects.get(email=id_info['email'])
            serializer = UserSerializer(user)
            return Response({
                "user": serializer.data,
                "token": requestJson['access_token'] 
            }, status=status.HTTP_200_OK)
        except:
            user = User.objects.create(
                first_name = id_info['given_name'],
                last_name = id_info['family_name'],
                last_login = datetime.datetime.now(),
                username = id_info['given_name'] + " " + id_info['family_name'],
                #Probably wanna hash this
                password = "GOOGLEAUTH",
                email = id_info['email']
            )
            serializer = UserSerializer(user)
            return Response({
                "user": serializer.data,
                "token": requestJson['access_token'] 
            }, status=status.HTTP_201_CREATED)