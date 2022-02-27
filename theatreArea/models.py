
from re import T
from django.db import models
from userlogin.models import extends

# Create your models here.

class theatres(models.Model):
    owner_name = models.CharField(max_length=30,null=False)
    location = models.CharField(max_length=50)
    theatre_name = models.CharField(max_length=50,null=False)
    phone = models.CharField(max_length=10,unique=True,null=False)
    email = models.EmailField(unique=True,null=False)
    password = models.CharField(max_length=100,null=False)
    username = models.CharField(max_length=30,unique=True,null=False)
    location_url = models.CharField(max_length=500,null=True)




class movies(models.Model):
    Movie = models.CharField(max_length=50)
    tmdb = models.IntegerField()
    


class screens(models.Model):
    theatre = models.ForeignKey(theatres,on_delete=models.CASCADE,null=False)
    screen_name = models.CharField(max_length=20)
    g_r_no = models.IntegerField(default=False)
    g_c_no = models.IntegerField(default=False)
    g_price = models.IntegerField(default=False)
    sp_r_no = models.IntegerField(default=False)
    sp_c_no = models.IntegerField(default=False)
    sp_price = models.IntegerField(default=False)
    s_r_no = models.IntegerField(default=False)
    s_c_no = models.IntegerField(default=False)
    s_price = models.IntegerField(default=False)
    



class shows(models.Model):
    screen = models.ForeignKey(screens,on_delete=models.CASCADE,null=False)
    time = models.TimeField(null=False)
    movie =models.ForeignKey(movies,on_delete=models.CASCADE,null=False)
    exp_date = models.DateField(default='22-02-2000')
    


class tickets(models.Model):
    ticket_uid = models.CharField(max_length=500,default=False)
    user = models.ForeignKey(extends,on_delete=models.CASCADE,null=False)
    show = models.ForeignKey(shows,on_delete=models.CASCADE,null=False)
    total_price=models.IntegerField(null=True)
    date=models.DateField(auto_now_add=True)




class booked_seats(models.Model):
    show = models.ForeignKey(shows,on_delete=models.CASCADE,null=False)
    user = models.ForeignKey(extends,on_delete=models.CASCADE,null=True)
    g_user = models.CharField(max_length=250,null=True)
    seat_no = models.CharField(max_length=20,default=False)
    seat_category = models.CharField(max_length=50)
    date = models.DateTimeField(auto_now_add=True)
    ticket =models.ForeignKey(tickets,on_delete=models.CASCADE,null=True)
    

class promocodes(models.Model):
    code=models.CharField(max_length=250,null=True)
    coupen_offer = models.IntegerField(null = True)

class used_codes(models.Model):
    code =models.ForeignKey(promocodes,on_delete=models.CASCADE,null=False)
    user =models.ForeignKey(extends,on_delete=models.CASCADE,null=False)