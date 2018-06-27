from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework.authtoken.models import Token
from django.contrib.auth import authenticate
from django.contrib.auth.models import User

from io import BytesIO
import requests
import os
from django.core.files import File

import facebook

from .models import PhoneUser, SocialUser, UserProfile
from .serializers import UserPhotoUploadSerializer, UserProfileSerializer

import uuid


@api_view(['POST'])
def register(request):
    response = {'status': False, 'message': ""}

    username = request.data.get('username')
    password = request.data.get('password')
    email = request.data.get('email')
    first_name = request.data.get('first_name')
    last_name = request.data.get('last_name')
    gender = request.data.get('gender')
    phone = request.data.get('phone')

    if not username:
        if email:
            username = email.split('@')[0] + uuid.uuid4().hex[:6]
        elif phone:
            username = "phone_{}".format(phone)

    if not username:
        response['message'] = "Username is required"
        return Response(response)

    if not email:
        response['message'] = "Email is required"
        return Response(response)

    if not password:
        response['password'] = "Password is required"
        return Response(response)

    if not first_name:
        response['message'] = "first_name is required"
        return Response(response)

    if not last_name:
        response['message'] = "last_name is required"
        return Response(response)

    if phone:
        try:
            phone_user = PhoneUser.objects.get(phone=phone)
        except:
            phone_user = False

        if phone_user:
            response['message'] = "Phone number exists"
            return Response(response)


    users_count = User.objects.filter(username=username).count()
    users_email_count = User.objects.filter(email=email).count()

    if users_count > 0:
        response['message'] = "Username exists. Try different username"
        return Response(response)
    elif users_email_count > 0:
        response['message'] = "Email exists. Try different email"
        return Response(response)
    else:
        user = User()
        user.username = username
        user.set_password(password)
        user.first_name = first_name
        user.last_name = last_name
        user.email = email

        user.save()

        if phone:
            phone_user = PhoneUser()
            phone_user.user = user
            phone_user.phone = phone

            phone_user.save()

        user_profiles = UserProfile.objects.filter(user=user)
        if len(user_profiles):
            user_profile = user_profiles[0]
        else:
            user_profile = UserProfile()
            user_profile.user = user

        serializer = UserPhotoUploadSerializer(data=request.data)
        if serializer.is_valid():
            profile_photo = serializer.validated_data.get('profile_photo')
            if profile_photo:
                user_profile.profile_photo = profile_photo

        user_profile.save()

        token, _ = Token.objects.get_or_create(user=user)

        response['status'] = True
        response['token'] = token.key
        response['user_id'] = user.id
        response['message'] = "Signed up and token generated"

    return Response(response)


@api_view(['POST'])
def login(request):
    response = {"status": False, "message": "Incorrect credentials"}
    user = None

    username = request.data.get('username')
    phone = request.data.get('phone')
    email = request.data.get('email')
    password = request.data.get('password')

    if password:
        if username:
            user = authenticate(username=username,password=password)
        elif phone:
            try:
                phone_user = PhoneUser.objects.get(phone=phone)
                if phone_user.user.check_password(password):
                    user = phone_user.user
                else:
                    user = None
            except:
                user = None
        elif email:
            user = User.objects.get(email=email)
            try:
                if not user.check_password(password):
                    user = None
            except:
                user = None


    if user:
        token, _ = Token.objects.get_or_create(user=user)
        response['status'] = True
        response['message'] = "Token generated"
        response['user_id'] = user.id
        response['token'] = token.key

    return Response(response)


@api_view(['POST'])
def social(request):

    network = request.data.get('network', "N/A")
    identifier = request.data.get('identifier', "N/A")
    token = request.data.get('token', "N/A")
    username = request.data.get('username', "N/A")
    email = request.data.get('email', "N/A")
    first_name = request.data.get('first_name', "N/A")
    last_name = request.data.get('last_name', "N/A")

    response = {"status": False}
    user = None
    is_new_user = False

    if email == "N/A":
        response['message'] = "Email is required"
        return Response(response)
    if first_name == "N/A":
        response['message'] = "first_name is required"
        return Response(response)
    if last_name == "N/A":
        response['message'] = "last_name is required"
        return Response(response)
    if network == "N/A":
        response['message'] = "network is required"
        return Response(response)
    if token == "N/A":
        response['message'] = "token is required"
        return Response(response)
    if identifier == "N/A":
        response['message'] = "identifier is required"
        return Response(response)

    if username == "N/A":
        username = "{}_{}".format(network, identifier)

    try:
        social_user = SocialUser.objects.get(network=network, identifier=identifier)
        user = social_user.user

        # Update access token if the token doesn't match
        if token != 'N/A' and social_user.token != token:
            social_user.token = token
            social_user.save()

    except:
        if email:
            try:
                user = User.objects.get(email=email)
            except:
                user = None
        else:
            user = None

        if user is None:
            user = User()

            user.username = username

            user.email = email
            user.first_name = first_name
            user.last_name = last_name
            user.set_password(token)
            user.save()
            user.is_active = True

            is_new_user = True

        # Exchange long lived token
        photo_url = None
        extended_token = "N/A"
        if token:
            graph = facebook.GraphAPI(access_token=token)
            result = graph.request("/me/picture?type=large")
            photo_url = result['url']

            """
            extended_token = graph.extend_access_token(
                app_id="1386694768080629",
                app_secret="e46ad6ac303e2190e94179cac30e8343"
            )
            """

        social_user = SocialUser(network=network, identifier=identifier, user=user, token=extended_token)
        social_user.save()

        if photo_url:
            user_profile = UserProfile(user=user)
            resp = requests.get(photo_url)

            fp = BytesIO()
            fp.write(resp.content)
            user_profile.profile_photo.save(
                os.path.basename(photo_url) + ".jpg",
                File(fp)
            )

            user_profile.save()

    if user:
        auth_token, _ = Token.objects.get_or_create(user=user)
        response['status'] = True
        response['token'] = auth_token.key
        response['user_id'] = user.id
        response['isNewUser'] = is_new_user

    return Response(response)