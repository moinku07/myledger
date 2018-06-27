from django.db import models
from django.contrib.auth.models import User


class AccountType(models.Model):

    ACCOUNTTYPE_CHOICES = (
        (1, 'Savings'),
        (2, 'Expense')
    )

    user = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=30)
    type = models.IntegerField(choices=ACCOUNTTYPE_CHOICES, default=1)
    created_at = models.DateTimeField("Created At", auto_now_add=True)
    updated_at = models.DateTimeField("Updated At", auto_now=True)
    deleted_at = models.DateTimeField("Deleted At", null=True, blank=True)

    def __str__(self):
        return "{}".format(self.name)

class Account(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    accounttype = models.ForeignKey(AccountType, on_delete=models.CASCADE)
    description = models.TextField()
    amount = models.DecimalField(decimal_places=2, max_digits=15)
    created_at = models.DateTimeField("Created At", auto_now_add=True)
    updated_at = models.DateTimeField("Updated At", auto_now=True)
    deleted_at = models.DateTimeField("Deleted At", null=True, blank=True)

    def __str__(self):
        return "{}".format(self.description[:50])