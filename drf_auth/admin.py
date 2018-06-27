from django.contrib import admin
from .models import PhoneUser, SocialUser, UserProfile

# Register your models here.

admin.site.register(SocialUser)
admin.site.register(PhoneUser)
admin.site.register(UserProfile)