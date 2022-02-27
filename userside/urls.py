

from django.urls import path
from . import views



urlpatterns = [
    
    
    path('checkout', views.checkout, name='checkout'),
    path('show_more_upcoming', views.show_more_upcoming, name='show_more_upcoming'),
    path('movie_details', views.movie_details, name='movie_details'),
    path('show_more', views.show_more, name='show_more'),
    path('select_theatre', views.select_theatre, name='select_theatre'),
    path('select_seats', views.select_seats, name='select_seats'),
    path('logout/', views.logout, name='logout'),
    path('book_tickets', views.book_tickets, name='book_tickets'),
    path('register_after_select', views.register_after_select, name='register_after_select'),
    path('login_after_select', views.login_after_select, name='login_after_select'),
    path('theatre_loc', views.theatre_loc, name='theatre_loc'),
    path('user_select_date', views.user_select_date, name='user_select_date'),
    path('search_theatre', views.search_theatre, name='search_theatre'),
    path('theatre_result', views.theatre_result, name='theatre_result'),
    path('user_select_date_theatre', views.user_select_date_theatre, name='user_select_date_theatre'),
    path('checkout_timer',views.checkout_timer,name='checkout_timer'),
    path('booked_tickets',views.booked_tickets,name='booked_tickets'),
    path('check_promo',views.check_promo,name='check_promo'),

]