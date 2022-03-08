from django.shortcuts import render,redirect
from userlogin.models import extends
from theatreArea.models import theatres,movies,promocodes,tickets
from .forms import theatreForm
from django.views.decorators.cache import never_cache
import datetime
from dateutil.relativedelta import *




@never_cache
def admin_home(request):
     if request.session.has_key('super'):
          admin = request.session['super']
          valid_tickets = tickets.objects.all()
          event_date= datetime.date.today()
          months=[]
          dates =[]
          for i in range(5):
               the_day = event_date - datetime.timedelta(days=i)
               dates.append(str(the_day))   
               the_month = event_date - relativedelta(months=+i)
               months.append(str(the_month))


          today=[]
          day_back_1=[]
          day_back_2=[]
          day_back_3=[]
          for i in valid_tickets:
               if i.date.strftime('%Y-%m-%d')==dates[0]:
                    today.append(i)
               elif i.date.strftime('%Y-%m-%d')==dates[1]:
                    day_back_1.append(i)
               elif i.date.strftime('%Y-%m-%d')==dates[2]:
                    day_back_2.append(i)
               elif i.date.strftime('%Y-%m-%d')==dates[3]:
                    day_back_3.append(i)
                    
          today_count=len(today)
          day_back_1_count=len(day_back_1)
          day_back_2_count=len(day_back_2)
          day_back_3_count=len(day_back_3)

          day_data={
               'today':today_count,
               'day_back_1':day_back_1_count,
               'day_back_2':day_back_2_count,
               'day_back_3':day_back_3_count,
          }


          # month==============================

          month=[]
          month_back_1=[]
          month_back_2=[]
          month_back_3=[]
          for i in valid_tickets:
               if i.date.strftime('%Y-%m-%d')>=months[1]:
                    month.append(i)
               elif i.date.strftime('%Y-%m-%d')>=months[2] and i.date.strftime('%Y-%m-%d')<months[1]:
                    month_back_1.append(i)
               elif i.date.strftime('%Y-%m-%d')==months[3] and i.date.strftime('%Y-%m-%d')<months[2]:
                    month_back_2.append(i)
               elif i.date.strftime('%Y-%m-%d')==months[4] and i.date.strftime('%Y-%m-%d')<months[3]:
                    month_back_3.append(i)
                    
          month_count=len(month)
          month_back_1_count=len(month_back_1)
          month_back_2_count=len(month_back_2)
          month_back_3_count=len(month_back_3)

          month_data={
               'month':month_count,
               'month_back_1':month_back_1_count,
               'month_back_2':month_back_2_count,
               'month_back_3':month_back_3_count,
          }


          total_price=0
          for i in valid_tickets:
               total_price+=i.total_price



          all_sold_tickets=len(valid_tickets)
          data={
               'all_sold_tickets':all_sold_tickets,
               'total_price':total_price
          }
          return render(request,'admin/index.html',{'data':data,'day_data':day_data,'month_data':month_data,'admin':admin})
     return render(request,'home.html')


def block_user(request):
     id = request.GET['id']
     user = extends.objects.get(id = id)
     user.is_active  = not (user.is_active)
     user.save()
     return redirect('/admin/manage_user')


def block_theatre(request):
     id = request.GET['id']
     theatre = theatres.objects.get(id = id)
     if theatre.active:
          theatres.objects.filter(id=id).update(active =False)
     else:
          theatres.objects.filter(id=id).update(active =True)

     return redirect('/admin/manage_theatres')


@never_cache
def manage_user(request):
     values = extends.objects.all()
     return render(request,'admin/adm_user_manage.html', {'values':values})




@never_cache
def manage_theatres(request):
     values = theatres.objects.all()
     return render(request,'admin/adm_theatre_manage.html', {'values':values})




@never_cache
def user_delete(request):
    id = request.GET.get('id')
    extends.objects.filter(id=id).delete()
    return redirect(manage_user)




@never_cache
def movie_delete(request):
    id = request.GET.get('id')
    movies.objects.filter(id=id).delete()
    return redirect(movie)



def theatre_delete(request):
    id = request.GET.get('id')
    theatres.objects.filter(id=id).delete()
    return redirect(manage_theatres)



@never_cache
def add_theatre(request):
     form = theatreForm(request.POST or None)
     if request.method =='POST':
         username = request.POST['username']
         owner_name = request.POST['owner_name']
         theatre_name = request.POST['theatre_name']
         location = request.POST['location']
         location_url = request.POST['location_url']
         email = request.POST['email']
         phone = request.POST['phone']
         password = request.POST['password']

         if form.is_valid():
              
              theatres.objects.create(username=username, owner_name=owner_name, theatre_name=theatre_name, email=email, location=location, phone=phone, password=password, location_url=location_url).save()
              return redirect(manage_theatres)
     return render(request,'admin/add_theatre.html',{'form':form})




@never_cache
def movie(request):
     all_movie= movies.objects.all()
     return render(request,'admin/movies.html',{'allmovie':all_movie})




@never_cache
def add_movies(request):
     all_movie= movies.objects.all()
     if request.method =='POST':   
          movie = request.POST['movie']
          tmdb_id = request.POST['tmdb']

          movies.objects.create(Movie=movie,tmdb=tmdb_id).save()
          return render(request,'admin/movies.html',{'allmovie':all_movie})
     return render(request,'admin/movies.html',{'allmovie':all_movie})


def add_coupens(request):
     if request.method=='POST':
          code=request.POST['code']
          offer=request.POST['offer']
          promocodes.objects.create(code=code,coupen_offer=offer).save()
          return redirect('admin_home')