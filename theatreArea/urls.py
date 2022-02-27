from django.urls import path
from . import views



urlpatterns = [
    
    path('login', views.login, name='login'),
    path('home', views.home, name='home'),
    path('add_screen', views.add_screen, name='add_screen'),
    path('logout', views.logout, name='logout'),
    path('screen', views.screen),
    path('add_show', views.add_show, name='add_show'),
    path('edit_screen', views.edit_screen, name='add_show'),
    path('delete_show', views.delete_show, name='delete_show'),
    
]
