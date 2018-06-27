from rest_framework.viewsets import ModelViewSet
from .models import Account, AccountType
from .serializers import AccountSerializer, AccountTypeSerializer

class AccountTypeViewSet(ModelViewSet):
    serializer_class = AccountTypeSerializer
    queryset = AccountType.objects.all()

class AccountViewSet(ModelViewSet):
    serializer_class = AccountSerializer
    queryset = Account.objects.all()


