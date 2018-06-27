from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework.authtoken.models import Token
from .models import PhoneUser, SocialUser, UserProfile
from .serializers import UserPhotoUploadSerializer, UserProfileSerializer
from django.contrib.auth.models import User
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