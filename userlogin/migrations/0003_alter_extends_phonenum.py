# Generated by Django 4.0.1 on 2022-01-18 08:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userlogin', '0002_alter_extends_phonenum'),
    ]

    operations = [
        migrations.AlterField(
            model_name='extends',
            name='phonenum',
            field=models.CharField(max_length=10, unique=True),
        ),
    ]