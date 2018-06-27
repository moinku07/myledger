from rest_framework.serializers import ModelSerializer
from .models import AccountType, Account

class AccountTypeSerializer(ModelSerializer):
    class Meta:
        model = AccountType
        fields = '__all__'

class AccountSerializer(ModelSerializer):
    class Meta:
        model = Account
        fields = '__all__'