# Generated by Django 2.0.6 on 2018-06-27 05:27

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_auto_20180627_0444'),
    ]

    operations = [
        migrations.AlterField(
            model_name='account',
            name='accounttype',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.AccountType'),
        ),
    ]
