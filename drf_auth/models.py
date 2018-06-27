from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class PhoneUser(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    phone = models.CharField('Phone', max_length=30, unique=True)

    def __str__(self):
        return "{} - {}".format(self.user.username, self.phone)

class SocialUser(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    network = models.CharField(max_length=30)
    identifier = models.CharField(max_length=100)
    token = models.TextField()

    def __str__(self):
        return "{} - {}".format(self.user.username, self.network)


class UserProfile(models.Model):
    GENDER_CHOICES = (
        ('M', 'Male'),
        ('F', 'Female'),
        ('O', 'Others')
    )

    user = models.ForeignKey(User, on_delete=models.CASCADE)
    profile_photo = models.ImageField(upload_to='users/profile-photos')
    gender = models.CharField(max_length=1, null=True, blank=True, choices=GENDER_CHOICES)
    is_private = models.BooleanField("Is Private?", default=False)

    def __str__(self):
        return "{} - {}".format(self.user.username, self.user_id)