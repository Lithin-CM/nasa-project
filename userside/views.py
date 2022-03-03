
from django.http import JsonResponse
from django.shortcuts import render,redirect
from project_1.settings import RAZORPAY_API_KEY, RAZORPAY_API_SECRET_KEY
import razorpay
import requests
from theatreArea.models import screens,movies,shows,booked_seats,theatres,tickets,promocodes,used_codes
from userlogin.models import extends
from django.contrib.auth import logout as auth_logout
from userlogin.views import home
from django.views.decorators.cache import never_cache
import datetime 
from datetime import time
import uuid 
from django.core.paginator import Paginator


api_key = "e8059443c46470e54e1594d1d888e61d"
api_base_url = "https://api.themoviedb.org/3"



@never_cache
def select_seats(request):
    if request.session.has_key('login_after_selection'):
        del request.session['login_after_selection']
    if request.session.has_key('coupen_show_id'):
        del request.session['coupen_show_id']
    if request.session.has_key('coupen_not_available'):
        del request.session['coupen_not_available']
    if request.session.has_key('coupen_used'):
        del request.session['coupen_used']
        

    if request.session.has_key('g_user_key'):
        g_user_key = request.session['g_user_key']
        booked_seats.objects.filter(g_user=g_user_key, user_id__isnull=True).delete()
        
    show_id = request.GET['show']
    show = shows.objects.get(id=show_id)
    screen =screens.objects.get(id=show.screen_id)
    
    g_row= []
    g_r_no = screen.g_r_no+1
    for i in range(1,g_r_no):
        g_row.append(i)
    g_column= []

    g_c_no = screen.g_c_no+1
    for i in range(1,g_c_no):
        g_column.append(i)


    gold ={
        'row':g_row,
        'column':g_column
    }

    sp_row= []
    sp_r_no = screen.sp_r_no+1
    for i in range(1,sp_r_no):
        sp_row.append(i)
    sp_column= []
    sp_c_no = screen.sp_c_no+1
    for i in range(1,sp_c_no):
        sp_column.append(i)


        silver_plus ={
        'row':sp_row,
        'column':sp_column
    }

    s_row= []
    s_r_no = screen.s_r_no+1
    for i in range(1,s_r_no):
        s_row.append(i)
    s_column= []
    s_c_no = screen.s_c_no+1
    for i in range(1,s_c_no):
        s_column.append(i)

    
    silver ={
        'row':s_row,
        'column':s_column
    }
    seatnu=[]
    booked_seats_numbers = booked_seats.objects.filter(show_id=show_id,user_id__isnull=False)
    for i in booked_seats_numbers:
        seatnu.append(i.seat_no)

    if request.session.has_key('user'):
        username =request.session['user']
        user = extends.objects.get(username = username)
        return render(request,'userside/movie-seat-plan.html',{'user':user, 'gold':gold,'silver_plus':silver_plus, 'silver':silver,'show':show,'booked':seatnu})
    else:
        return render(request,'userside/movie-seat-plan.html',{'gold':gold,'silver_plus':silver_plus, 'silver':silver,'show':show,'booked':seatnu})



@never_cache
def checkout(request):
    err=''
    if request.method=='GET':
        if request.session.has_key('login_after_selection'):
            showid = request.session['login_after_selection']

        if request.session.has_key('coupen_show_id'):
            showid = request.session['coupen_show_id']

        if request.session.has_key('coupen_not_available'):
            showid = request.session['coupen_not_available']
            err='Coupen not available'

        if request.session.has_key('coupen_used'):
            showid = request.session['coupen_used']
            err='This coupen is already used'
            

        g_user_id = request.session['g_user_key']
        
        silver_var = [i.seat_no for i in booked_seats.objects.filter(g_user =g_user_id, show_id = showid, seat_category = 'silver')]
        silver_plus_var = [i.seat_no for i in booked_seats.objects.filter(g_user =g_user_id, show_id = showid, seat_category = 'silver_plus')]
        gold_var = [i.seat_no for i in booked_seats.objects.filter(g_user =g_user_id, show_id = showid, seat_category = 'gold')]
        
        seats = {'silver':silver_var,'silver_plus':silver_plus_var,'gold':gold_var}
        

    if request.method =='POST':
        showid = request.POST['show']
        if not request.session.session_key:
            request.session.create()
        g_user_id = request.session.session_key
        print(g_user_id,'===============================================')
        request.session['g_user_key']= g_user_id

        silver_var = request.POST.getlist('silver[]')
        silver_plus_var = request.POST.getlist('silver_plus[]')
        gold_var = request.POST.getlist('gold[]')

        seats = {'silver':silver_var,'silver_plus':silver_plus_var,'gold':gold_var}
        for i,k in seats.items():
            for j in k:
                
                booked_seats(show_id=showid, g_user=g_user_id, seat_no = j, seat_category =i).save()
                print(showid,'==========',g_user_id,'==========',j,'==========',i)
          

    show = shows.objects.get(id=showid)

    s_price=show.screen.s_price
    sp_price=show.screen.sp_price
    g_price=show.screen.g_price
        
    silver_seat_count = len(seats['silver'])
    silver_plus_seat_count = len(seats['silver_plus'])
    gold_seat_count = len(seats['gold'])


    total_seats= silver_seat_count + silver_plus_seat_count + gold_seat_count

    seat_count ={'silver':silver_seat_count,'silver_plus':silver_plus_seat_count,'gold':gold_seat_count,'total_seats': total_seats}

    client = razorpay.Client(auth=(RAZORPAY_API_KEY, RAZORPAY_API_SECRET_KEY))

    total_price=(gold_seat_count*g_price)+(silver_plus_seat_count*sp_price)+(silver_seat_count*s_price)

    if request.session.has_key('coupen_show_id'):
        offer= int(request.GET['offer'])
        print(offer)
        amount_payable=total_price-((offer*total_price)/100)
    else:
        amount_payable=total_price

    DATA = {
        "amount": amount_payable*100,
        "currency": "INR",
        "payment_capture":1
    }
    payment_order= client.order.create(data=DATA)
    payment_order_id = payment_order['id']



    if request.session.has_key('user'):
        username =request.session['user']
        user = extends.objects.get(username = username)
        return render(request,'userside/checkout.html',{'user':user,'payment_order_id':payment_order_id, 'show':show, 'seat_count':seat_count,'seats':seats,'total_price':total_price,'amount_payable':amount_payable,'err':err})
    else:
        return render(request,'userside/checkout.html',{'show':show,'payment_order_id':payment_order_id, 'seat_count':seat_count,'seats':seats,'total_price':total_price,'amount_payable':amount_payable,'err':err})
     



def checkout_timer(request):
    sec=int(request.GET['data'])
    if sec>0: 
        sec-=1
        return JsonResponse({'sec':sec})
          
    

def booked_tickets(request):
    if request.session.has_key('login_after_selection'):
        del request.session['login_after_selection']
    if request.session.has_key('coupen_show_id'):
        del request.session['coupen_show_id']
    if request.session.has_key('coupen_not_available'):
        del request.session['coupen_not_available']
    if request.session.has_key('coupen_used'):
        del request.session['coupen_used']

    
    
        
    valid_tickets=[]
    all_tickets = tickets.objects.filter(user_id=user.id)
    current_date= datetime.date.today()
    for i in all_tickets:
        if i.show.exp_date >= current_date:
            valid_tickets.append(i)
    
    all_seats = booked_seats.objects.filter(user_id=user.id)
    valid_seats=[]
    current_date= datetime.date.today()
    for i in all_seats:
        if i.show.exp_date >= current_date:
            valid_seats.append(i)

    ticket ={
        'seats':valid_seats,
        'ticket':valid_tickets
    }
    return render(request,'userside/booked_tickets.html',{'tickets':ticket})

# =====================================================user api=================================================
   

@never_cache
def show_more_upcoming(request):
    if request.method=='POST':
        genre =request.POST['genre']
    else:
        genre ='All'
    if request.session.has_key('data'):
        data=request.session['data']
        movie = movies.objects.all()
        movie_list =[]
        
        for i in movie:
            endpoint_path = f"/movie/{i.tmdb}"
            endpoint = f"{api_base_url}{endpoint_path}?api_key={api_key}"
            m = requests.get(endpoint)
            movie = m.json()
            if movie['status']=='Released':
                if request.method =='POST':
                    for i in movie['genres'] :
                        if i['name']==genre:
                            movie_list.append(movie)
                else:
                    movie_list.append(movie)
            movie_list.sort(key=lambda s: s[data],  reverse=True) 
        if request.session.has_key('user'):
            username =request.session['user']
            user = extends.objects.get(username = username)
            return render(request,'userside/movie-list.html',{'user':user,'movies':movie_list,'genre':genre})
        else:
            return render(request,'userside/movie-list.html',{'movies':movie_list,'genre':genre})

    else:
        movie = movies.objects.all()
        upcoming_movie =[]
        for i in movie:
            endpoint_path = f"/movie/{i.tmdb}"
            endpoint = f"{api_base_url}{endpoint_path}?api_key={api_key}"
            m = requests.get(endpoint)
            movie = m.json()
            if movie['status']!='Released':
                if request.method =='POST':
                    for i in movie['genres'] :
                        if i['name']==genre:
                            upcoming_movie.append(movie)
                else:
                    upcoming_movie.append(movie)

    if request.session.has_key('user'):
        username =request.session['user']
        user = extends.objects.get(username = username)
        return render(request,'userside/movie-list.html',{'user':user,'movies':upcoming_movie,'genre':genre})
    else:
        return render(request,'userside/movie-list.html',{'movies':upcoming_movie,'genre':genre})


    



@never_cache
def show_more(request):

    data =request.GET['movie']
    request.session['data']=data

    return redirect('show_more_upcoming')
    



@never_cache
def movie_details(request):
    if request.session.has_key('data'):
        del request.session['data']

    movie_id= request.GET['movie']

# =======================movie trailor======================================

    videos_endpoint_path = f"/movie/{movie_id}/videos"
    videos_endpoint = f"{api_base_url}{videos_endpoint_path}?api_key={api_key}"
    u = requests.get(videos_endpoint)
    videos = u.json()


# =======================movie details======================================

   
    endpoint_path = f"/movie/{movie_id}"
    endpoint = f"{api_base_url}{endpoint_path}?api_key={api_key}"
    u = requests.get(endpoint)
    movie = u.json()

# ========================movie credits=====================================

    credits_endpoint_path = f"/movie/{movie_id}/credits"
    credits_endpoint = f"{api_base_url}{credits_endpoint_path}?api_key={api_key}"
    c = requests.get(credits_endpoint)
    credit = c.json()

    # ========================movie reviews=====================================

    reviews_endpoint_path = f"/movie/{movie_id}/reviews"
    reviews_endpoint = f"{api_base_url}{reviews_endpoint_path}?api_key={api_key}"
    r = requests.get(reviews_endpoint)
    reviews = r.json()

    if request.session.has_key('user'):
        username =request.session['user']
        user = extends.objects.get(username = username)
        return render(request,'userside/movie-details.html',{'user':user,'movie':movie,'credit':credit,'reviews':reviews,'movie_id':movie_id,'video':videos})
    else:
        return render(request,'userside/movie-details.html',{'movie':movie,'credit':credit,'reviews':reviews,'movie_id':movie_id,'video':videos})


# ==============================================================================================================================
# =======================SELECT THEATRE=========================================================================================




@never_cache
def select_theatre(request):
    if request.method=='POST':
        tmdb_id = request.POST['movie_id']
    elif request.session.has_key('movie'):
        tmdb_id = request.session['movie']
    
    movie = movies.objects.get(tmdb=tmdb_id)


    event_date = datetime.date.today()
    dates =[]
    for i in range(10):
        current_date = event_date + datetime.timedelta(days=i)
        dates.append(str(current_date))
    if request.session.has_key('user_show_date'):
        date = request.session['user_show_date']
    else:
        request.session['user_show_date']=dates[0]
        date = request.session['user_show_date']

    show_ids =shows.objects.filter(movie_id=movie, exp_date=date).all()
    all_location = theatres.objects.order_by('location').values('location').distinct()
    request.session['movie']=tmdb_id
    location = request.session['loc']
    all_theeare = theatres.objects.filter(location=location)
    theatre_names=[]
    for i in show_ids:
        if i.screen.theatre not in theatre_names:
            if i.screen.theatre in all_theeare:
                    theatre_names.append(i.screen.theatre)
    
    endpoint_path = f"/movie/{tmdb_id}"
    endpoint = f"{api_base_url}{endpoint_path}?api_key={api_key}"
    m = requests.get(endpoint)
    movie_data = m.json()


    if request.session.has_key('user'):
        username =request.session['user']
        user = extends.objects.get(username = username)
        return render(request,'userside/movie-ticket-plan.html',{'user':user,'theatre':theatre_names,'shows':show_ids,'movie':movie_data,'all_loc':all_location, 'all_dates':dates})
    else:
        return render(request,'userside/movie-ticket-plan.html',{'theatre':theatre_names,'shows':show_ids,'movie':movie_data,'all_loc':all_location, 'all_dates':dates})



def user_select_date(request):
    if request.method=='POST':
        date = request.POST['date']
        request.session['user_show_date']= date
        return redirect('select_theatre')





def theatre_loc(request):
    if request.method =='POST':
        if request.session.has_key('loc'):
            del request.session['loc']
        loc = request.POST['my_options']
        request.session['loc'] = loc
    return redirect('select_theatre')



def search_theatre(request):
    search_string=request.GET['data']
    location =request.session['loc']
    date =request.session['user_show_date']
    all_theeare = theatres.objects.filter(location=location, theatre_name__startswith = search_string) | theatres.objects.filter(location=location, theatre_name__icontains   = search_string)
    data =all_theeare.values()
    return JsonResponse(list(data),safe=False)


def theatre_result(request):
    event_date = datetime.date.today()
    dates =[]
    for i in range(10):
        current_date = event_date + datetime.timedelta(days=i)
        dates.append(str(current_date))

    theatre_id = int(request.GET['theatre_id'])
    theatre = theatres.objects.get(id = theatre_id)
    date = request.session['user_show_date']
    screens_in_theatre = screens.objects.filter(theatre_id = theatre_id)
    shows_in_screens=[]
    for i in screens_in_theatre:
        shows_in_screens.extend(shows.objects.filter(screen =i, exp_date=date))
    movies_in_shows = []
    for i in shows_in_screens:
        if i.movie not in movies_in_shows:
            movies_in_shows.append(i.movie)
    
    theatre_details ={
        'theatre':theatre,
        'screens':screens_in_theatre,
        'shows':shows_in_screens,
        'movies':movies_in_shows,
        'all_dates':dates
    }
    return render(request,'userside/theatre_details.html',{'theatre_details':theatre_details})



    

def user_select_date_theatre(request):
    if request.method=='POST':
        date = request.POST['date']
        theatre_id = request.POST['theatre_id']
        request.session['user_show_date']= date
        return redirect('/userside/theatre_result?theatre_id='+theatre_id)




# booking the tickets ==========================================================================


def check_promo(request):

    if request.method=='POST':
        code =request.POST['code']  
        show_id =request.POST['show_id']
        user =request.user
        if promocodes.objects.filter(code=code).exists():
            code=promocodes.objects.get(code=code)
            offer=code.coupen_offer
            if used_codes.objects.filter(code_id=code.id,user_id=user.id).exists():
                request.session['coupen_used']=show_id
                return redirect('/userside/checkout')            
            else:
                request.session['coupen_show_id']=show_id
                used_codes.objects.create(code_id=code.id,user_id=user.id)
                return redirect('/userside/checkout?offer='+str(offer))
        else:
            request.session['coupen_not_available']=show_id
            return redirect('/userside/checkout')






@never_cache
def book_tickets(request):
    show_id = request.GET['show']
    
    amount_payable = int(float(request.GET['amount_payable']))
    
    if request.session.has_key('user'):
        username =request.session['user']
        user = extends.objects.get(username = username)
        user_id =user.id
        ticket_uid=uuid.uuid4().hex[:6].upper()
        tickets.objects.create(user_id=user_id,show_id=show_id,ticket_uid=ticket_uid,total_price=amount_payable)
        ticket =tickets.objects.get(ticket_uid=ticket_uid)
        g_user_id = request.session['g_user_key']
        ticket_data = booked_seats.objects.filter(g_user =g_user_id, show_id = show_id,ticket_id__isnull=True )
        ticket_data.update(user = user_id,ticket_id=ticket.id)
        return redirect('booked_tickets')


@never_cache
def login_after_select(request):
    showid = request.GET['show']
    request.session['login_after_selection'] = showid
    return redirect('/signin')



@never_cache
def register_after_select(request):
    showid = request.GET['show']
    request.session['login_after_selection'] = showid
    return redirect('/signup')

# Log out ===========================================================


@never_cache
def logout(request):
    if request.session.has_key('super'):
        del request.session['super']
    elif request.session.has_key('user'):
        del request.session['user']
        
    auth_logout(request)
    return redirect('/')




# end logout +++=============================================================