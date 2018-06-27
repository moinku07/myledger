from django.urls import path
from django.conf.urls import url, include

from .views import register

app_name = "drf_auth"

urlpatterns = [
    url('^register/$', register, name="register"),
]