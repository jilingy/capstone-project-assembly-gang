from django.conf.urls import url
from django.contrib import admin
from django.urls import path, include
from django.views.decorators.csrf import csrf_exempt

urlpatterns = [
    path('api-auth/', include('rest_framework.urls')),
    path('rest-auth/', include('rest_auth.urls')),
    path('rest-auth/registration/', include('rest_auth.registration.urls')),
    path('admin/', admin.site.urls),
    path('api/', include('app.api.urls')),
    path('', include('accounts.urls')),
    path('accounts/', include('allauth.urls'))
]
