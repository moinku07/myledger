# Generated by Django 2.0.6 on 2018-06-27 06:30

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0005_auto_20180627_0630'),
    ]

    operations = [
        migrations.AlterField(
            model_name='account',
            name='accounttype',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.AccountType'),
        ),
    ]
