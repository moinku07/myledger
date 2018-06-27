from django.urls import path
from django.conf.urls import url, include

from .views import register, login, social

app_name = "drf_auth"

urlpatterns = [
    url('^register/$', register, name="register"),
    url('^login/$', login, name="login"),
    url('^social/$', social, name="social"),
]