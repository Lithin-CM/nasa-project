from hashlib import sha1
from itertools import count
from django.shortcuts import render,redirect
from userlogin.forms import CreateLoginForm
from .models import theatres,screens,shows,movies,booked_seats,tickets
import datetime
from dateutil.relativedelta import *




def home(request):
    if request.session.has_key('theatre'):
        username = request.session['theatre']
        owner= theatres.objects.get(username = username)
        screen =screens.objects.filter(theatre_id=owner.id)
        all_shows=[]
        for i in screen:
            all_shows.extend(shows.objects.filter(screen_id=i.id))
       
        total_tickets=[]
        valid_tickets=[]
        for i in all_shows:
            total_tickets.extend(booked_seats.objects.filter(show_id=i.id))
            valid_tickets.extend(tickets.objects.filter(show_id=i.id))
        
        total_price=0
        for i in valid_tickets:
            total_price+=i.total_price
        
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


        print(month_data)



        all_sold_tickets=len(total_tickets)
        data={
            'all_sold_tickets':all_sold_tickets,
            'total_price':total_price
        }
        return render(request,'theatre_owner/dashboard.html',{'screen':screen,'data':data,'day_data':day_data,'month_data':month_data})
    return redirect(login)



def screen(request):
    event_date = datetime.date.today()
    dates =[]
    for i in range(10):
        current_date = event_date + datetime.timedelta(days=i)
        dates.append(str(current_date))
    if request.method=='POST':
        date = request.POST['date']
        request.session['theatre_show_date'] = date
        id = request.POST['screen']
        show_list= shows.objects.filter(screen_id=id, exp_date =date).all()
        show_count =shows.objects.filter(screen_id=id, exp_date =date).count()
    else:
        if request.session.has_key('theatre_show_date'):
            date = request.session['theatre_show_date']
        else:
            request.session['theatre_show_date'] = dates[0]
            date = request.session['theatre_show_date']
        id = request.GET.get('id')
        show_list= shows.objects.filter(screen_id=id, exp_date =date).all()
        show_count =shows.objects.filter(screen_id=id, exp_date =date).count()
        
    seat_list =screens.objects.get(id=id)
    movie_list=movies.objects.all()

    

    return render(request,'theatre/screens.html',{'seat':seat_list,'id':id, 'show_list':show_list, 'count':show_count, 'all_dates':dates,'movies':movie_list})
    



def login(request):
    form = CreateLoginForm(request.POST or None)
    if request.session.has_key('theatre'):
        return redirect(home)
    if request.method =='POST':
        
        if form.is_valid():
            username = request.POST['username']
            password = request.POST['password']
            if theatres.objects.filter(username=username).exists():
                user = theatres.objects.get(username=username)
               
                pas = user.password
              
                if pas == password:
                    request.session['theatre'] = username
                    return redirect(home)
                return render(request,'theatre/sign-in.html',{'form':form,"err":"Invalid Credential"})
    return render(request,'theatre/sign-in.html',{'form':form})



def add_screen(request):
    if request.session.has_key('theatre'):
        username = request.session['theatre']
        user_id = theatres.objects.get(username = username)
        valid_user = user_id.id
        if request.method == "POST":  
            screen_name = request.POST['screen_name']
            g_r_no = request.POST['g_r_no']
            g_c_no = request.POST['g_c_no']
            g_price = request.POST['g_price']
            sp_r_no = request.POST['sp_r_no']
            sp_c_no = request.POST['sp_c_no']
            sp_price = request.POST['sp_price']
            s_r_no = request.POST['s_r_no']
            s_c_no = request.POST['s_c_no']
            s_price = request.POST['s_price']

            screens.objects.create(screen_name=screen_name,g_r_no=g_r_no, g_c_no=g_c_no, g_price=g_price, sp_r_no=sp_r_no, sp_c_no=sp_c_no, sp_price=sp_price, s_r_no=s_r_no, s_c_no=s_c_no, s_price=s_price,theatre_id = valid_user).save()
            return redirect(home)
        
        return render(request,'theatre/add_screen.html')
        
    
    return redirect(login)



def add_show(request):
    if request.method=='POST':
        date = request.POST['date']
        screen_id = request.POST['id']
        time = request.POST['time']
        movie = request.POST['movie']
        shows.objects.create(time=time, movie_id=movie, screen_id=screen_id, exp_date=date).save()
        return redirect('/theatre/screen?id='+screen_id)



def delete_show(request):
    id = request.GET.get('id')
    show = shows.objects.get(id=id)
    screen_id = str(show.screen_id)
    
    shows.objects.filter(id=id).delete()
    return redirect('/theatre/screen?id='+screen_id)
    

def edit_screen(request):
    screen_id = request.GET.get('id')
    if request.method=='POST':
        screen_id = request.POST['screen_id']
        screen_name = request.POST['screen_name']
        g_r_no = request.POST['g_r_no']
        g_c_no = request.POST['g_c_no']
        g_price = request.POST['g_price']
        sp_r_no = request.POST['sp_r_no']
        sp_c_no = request.POST['sp_c_no']
        sp_price = request.POST['sp_price']
        s_r_no = request.POST['s_r_no']
        s_c_no = request.POST['s_c_no']
        s_price = request.POST['s_price']
        screen =screens.objects.filter(id=screen_id)
       
        if screen:
            screens.objects.filter(id=screen_id).update(screen_name=screen_name, g_r_no=g_r_no, g_c_no=g_c_no, g_price=g_price, sp_r_no=sp_r_no, sp_c_no=sp_c_no, sp_price=sp_price, s_r_no=s_r_no, s_c_no=s_c_no, s_price=s_price)


        return redirect('/theatre/screen?id='+screen_id)
    screen_items = screens.objects.get(id =screen_id)
    return render(request,'theatre/edit_screen.html',{'id':screen_id,'items':screen_items})

        
def logout(request):
    del request.session['theatre']
    return redirect('/')
