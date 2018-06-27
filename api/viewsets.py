from rest_framework.viewsets import ModelViewSet
from rest_framework.decorators import permission_classes
from rest_framework.permissions import IsAuthenticated
from django.db.models import Q
from .models import Account, AccountType
from .serializers import AccountSerializer, AccountTypeSerializer

@permission_classes((IsAuthenticated,))
class AccountTypeViewSet(ModelViewSet):
    serializer_class = AccountTypeSerializer
    queryset = AccountType.objects.all()

    def get_queryset(self):
        user = self.request.GET.get('user')
        type = self.request.GET.get('type')
        order = self.request.GET.get('order')

        queryset = self.queryset

        if not self.request.user.is_superuser:
            queryset = queryset.filter(user=self.request.user)

        if user and self.request.user.is_superuser:
            queryset = queryset.filter(user=user)

        if type:
            queryset = queryset.filter(type=type)

        if order:
            queryset = queryset.order_by(order)

        return queryset

@permission_classes((IsAuthenticated,))
class AccountViewSet(ModelViewSet):
    serializer_class = AccountSerializer
    queryset = Account.objects.all()

    def get_queryset(self):
        user = self.request.GET.get('user')
        accounttype = self.request.GET.get('accounttype')
        order = self.request.GET.get('order')
        query = self.request.GET.get('query')

        queryset = self.queryset

        if not self.request.user.is_superuser:
            queryset = queryset.filter(user=self.request.user)

        if user and self.request.user.is_superuser:
            queryset = queryset.filter(user=user)

        if accounttype:
            queryset = queryset.filter(accounttype=accounttype)

        if order:
            queryset = queryset.order_by(order)

        if query:
            queryset = queryset.filter(description__icontains=query)

        return queryset


