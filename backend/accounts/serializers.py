from rest_framework import serializers
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from app.models import Profiles

# User Serializer

class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = (
            'id', 'username', 'email', 'first_name', 'last_name'
        )

# Register Serializer
class RegisterSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = (
            'id', 'username', 'email', 'first_name', 'last_name', 'password'
        )
        extra_kwargs = {'password' : {'write_only' : True}}

    def create(self, validated_data):
        user = User.objects.create_user(
            validated_data['username'],
            email=validated_data['email'],
            password=validated_data['password'],
            first_name=validated_data['first_name'],
            last_name=validated_data['last_name'],
        )
        return user

# Login Serializer
class LoginSerializer(serializers.Serializer):
    
    username = serializers.CharField()
    password = serializers.CharField()

    def validate(self, data):
        user = authenticate(**data)
        if user and user.is_active:
            return user
        raise serializers.ValidationError("Incorrect credentials!")

# Profiles Serializer
class ProfileSerializer(serializers.ModelSerializer):

    class Meta:
        model = Profiles
        fields = (
            'id', 'user', 'verification_code',
        )

    def create(self, validated_data):
        profile = Profiles.objects.create(
            user=validated_data['user'],
            verification_code=validated_data['verification_code']
        )
        return profile

    

