from django.urls import path
from . import views


urlpatterns = [
    path('admin_home/', views.admin_home, name='admin_home'),
    path('manage_user', views.manage_user, name='manage_user'),
    path('manage_theatres', views.manage_theatres, name='manage_theatres'),
    path('user_delete', views.user_delete, name='user_delete'),
    path('add_theatre/', views.add_theatre, name='add_theatre'),
    path('movies/', views.movie, name='movies'),
    path('add_movie', views.add_movies, name='add_movies'),
    path('movie_delete', views.movie_delete, name='movie_delete'),
    path('theatre_delete', views.theatre_delete, name='theatre_delete'),
    path('add_coupens', views.add_coupens, name='add_coupens'),

    
]