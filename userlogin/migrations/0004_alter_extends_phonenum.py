# Generated by Django 4.0.1 on 2022-02-17 07:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userlogin', '0003_alter_extends_phonenum'),
    ]

    operations = [
        migrations.AlterField(
            model_name='extends',
            name='phonenum',
            field=models.CharField(max_length=10, null=True, unique=True),
        ),
    ]