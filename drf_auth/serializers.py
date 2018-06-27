from rest_framework.serializers import Serializer, ImageField, DateTimeField, CharField, BooleanField

class UserPhotoUploadSerializer(Serializer):
    profile_photo = ImageField(required=True)


class UserProfileSerializer(Serializer):
    profile_photo = ImageField(required=False)
    gender = CharField(required=False)
    is_private = BooleanField(required=False)