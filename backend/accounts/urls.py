from django.urls import path, include
from .api import RegisterAPI, LoginAPI, UserAPI, ProfileAPI
from knox import views as knox_views
from django.views.decorators.csrf import csrf_exempt
from allauth.socialaccount.providers.oauth2.views import (
    OAuth2Adapter,
    OAuth2CallbackView,
    OAuth2LoginView,
)
from .googleviews import GoogleAuthLogin
from .views import GoogleLogin
from allauth.socialaccount.providers.google.views import (
    GoogleOAuth2Adapter,
    OAuth2CallbackView,
    OAuth2LoginView,
)

urlpatterns = [
    path('api/auth', include('knox.urls')),
    path('api/auth/register', RegisterAPI.as_view()),
    path('api/auth/login', LoginAPI.as_view()),
    path('api/auth/user', UserAPI.as_view()),
    path('api/auth/logout', knox_views.LogoutView.as_view(), name='knox_logout'),
    path('api/auth/profiles', ProfileAPI.as_view()),
    path('rest-auth/google/', GoogleLogin.as_view(), name='google_login'),  
]