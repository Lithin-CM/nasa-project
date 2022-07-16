

from adminArea.views import admin_home
from .forms import createUserForm,CreateLoginForm
from django.shortcuts import render,redirect
from django.contrib.auth import authenticate
from .models import extends
import os
from twilio.rest import Client
from django.views.decorators.cache import never_cache
from django.contrib.auth import logout as auth_logout
import requests
from theatreArea.models import movies, theatres, screens, shows

from decouple import config


num = ''
fm = ''
form = ''
username = ''
api_key = config("TMDB_Apikey")
api_base_url = config("TMDB_URL")

# Create your views here.


def send(num):

    try:
        account_sid = os.environ['TWILIO_ACCOUNT_SID'] = config("Twilo_Account")
        auth_token = os.environ['TWILIO_AUTH_TOKEN'] = config("TWILIO_AUTH_TOKEN")
        client = Client(account_sid, auth_token)

        verification = client.verify \
                            .services(config("services")) \
                            .verifications \
                            .create(to=num, channel='sms')
        return True                    
    except:
        return False
   


def verify(otp):
    global num
    try:
        account_sid = os.environ['TWILIO_ACCOUNT_SID'] =config("Twilo_Account")
        auth_token = os.environ['TWILIO_AUTH_TOKEN'] =  config("TWILIO_AUTH_TOKEN")
        client = Client(account_sid, auth_token)

        verification_check = client.verify \
                                .services(config("services")) \
                                .verification_checks \
                                .create(to=num, code=otp)

        return verification_check.status
    except:
        return False




@never_cache
def home(request):
    if request.session.has_key('data'):
        del request.session['data']
    if request.session.has_key('login_after_selection'):
        return redirect('userside/checkout')
        
    if request.session.has_key('super'):
        return redirect(admin_home)
        
    movie = movies.objects.all()
    movie_data =[]
    upcoming_movie =[]

    if request.session.has_key('loc'):
        loc =request.session['loc']
    else:
        all_location = theatres.objects.order_by('location').values('location').distinct()
        l = all_location[0]
        loc =l['location']    
        request.session['loc']=loc
    

    
    theatres_in_location = theatres.objects.filter(location=loc)
    
    screens_in_location = []
    for i in theatres_in_location:
        screens_in_location.extend(screens.objects.filter(theatre_id =i.id))

    shows_in_location = []
    for i in screens_in_location:
        shows_in_location.extend(shows.objects.filter(screen_id =i.id))
    
    movies_in_location_id =[]
    for i in shows_in_location:
        if i.movie not in movies_in_location_id:
            movies_in_location_id.append(movies.objects.get(id =i.movie_id))



    movies_in_location =[]
    for i in movies_in_location_id:
        movies_in_location_endpoint_path = f"/movie/{i.tmdb}"
        movies_in_location_endpoint = f"{api_base_url}{movies_in_location_endpoint_path}?api_key={api_key}"
        m = requests.get(movies_in_location_endpoint)
        movie_in = m.json()
        movies_in_location.append(movie_in)



    for i in movie:
        endpoint_path = f"/movie/{i.tmdb}"
        endpoint = f"{api_base_url}{endpoint_path}?api_key={api_key}"
        m = requests.get(endpoint)
        movie = m.json()
        if movie['status']=='Released':
            movie_data.append(movie)
        else:
            upcoming_movie.append(movie)

# ============================================= UPCOMING MOVIE ============================================

    upcoming_movie_data=upcoming_movie[:8]
    
# ============================================= POPULAR MOVIES ============================================

    movie_data.sort(key=lambda s: s['popularity'],  reverse=True) 
    popular_movie_data=movie_data[:8]

# ============================================= TOP RATED MOVIES ==========================================

    movie_data.sort(key=lambda s: s['vote_average'],  reverse=True) 
    top_rated_movie_data=movie_data[:8]

# ============================================= Location ==========================================
    all_location = theatres.objects.order_by('location').values('location').distinct()


    if request.session.has_key('user'):
        username =request.session['user']
        user = extends.objects.get(username = username)
        return render(request,'home.html',{'user':user,'popular_movie':popular_movie_data,'top_rated_movie':top_rated_movie_data,'upcoming_movie':upcoming_movie_data,'all_loc':all_location, 'movies_in_location':movies_in_location,'loc':loc})
    else:
        return render(request,'home.html',{'popular_movie':popular_movie_data,'top_rated_movie':top_rated_movie_data,'upcoming_movie':upcoming_movie_data,'all_loc':all_location,  'movies_in_location':movies_in_location,'loc':loc})
    

   


@never_cache
def loc_home(request):
    if request.method =='POST':
        if request.session.has_key('loc'):
            del request.session['loc']
        loc = request.POST['my_options']
        request.session['loc'] = loc
        return redirect(home)    


        
@never_cache
def google_login(request):
    user =request.user
    request.session['user'] = user.username
    return redirect('/')




@never_cache
def signin(request):
    if request.session.has_key('super'):
        return redirect(admin_home)
    elif request.session.has_key('user'):
        return redirect(home)
    global form ,num,username
    if request.method =='POST':
        form = CreateLoginForm(request.POST)
        if form.is_valid():
            username = request.POST['username']
            password = request.POST['password']
            user = authenticate(username=username,password=password)
            if user:
                if user.is_superuser:
                    request.session['super'] = username
                    return redirect(admin_home)
                request.session['user'] = username
                return redirect(home)
            
        return render(request,'sign-in.html',{'form':form,"err":"Invalid Credential"})
    form = CreateLoginForm()
    return render(request,'sign-in.html',{'form':form})


@never_cache
def signup(request):
    
    if request.session.has_key('super'):
        return redirect(admin_home)
    elif request.session.has_key('user'):
        return redirect(home)
    global fm , num
    fm = createUserForm(request.POST or None)
    if request.method =='POST':
        if fm.is_valid():
            n = request.POST['phonenum']
            num = "+91"+n
            if send(num):              
                return redirect(signup_otp)
            else:
                return render(request, 'sign-up.html', {'form':fm,'err':"invalid number"}) 
    return render(request, 'sign-up.html', {'form':fm})  




def u_signup_otp_resent(request):
    if send(num):
        return redirect(signup_otp)
    return redirect(signup)




@never_cache
def signup_otp(request):
    global fm
    if request.method =='POST':
        otp = request.POST['otp']
        if verify(otp) == "approved":
            fm.save()
            return redirect('signin')
        else:
            return render(request, 'admin/opt.html',{'err': "incorrect otp"})

    return render(request, 'admin/opt.html')



@never_cache
def u_login_verify(request):
    if request.method =='POST': 
        otp = request.POST['otp']
        if verify(otp) == "approved":
            request.session['user'] = username
            return redirect(home)
        return render(request, 'admin/otp_login.html',{'err': "incorrect otp"})
    return render(request, 'admin/otp_login.html')
   




@never_cache
def u_otp_resent(request):
    if send(num): 
         return redirect(u_login_verify)
    return redirect(user_login_otp)
     
    

@never_cache
def user_login_otp(request):
    global num,username
    if request.method =='POST':
        phone = request.POST['phone']
        if extends.objects.filter(phonenum=phone).exists():
            user = extends.objects.get(phonenum=phone)
            if user.is_active:
                username = user.username    
                num ="+91"+phone
                if send(num):  
                    return redirect(u_login_verify)
            return render(request, 'user-otp.html',{'err': "This user is blocked by the admin"})

        return render(request, 'user-otp.html',{'err': "number doesn't exist"})
        
    return render(request,'user-otp.html')




@never_cache
def logout(request):
    if request.session.has_key('super'):
        del request.session['super']
    elif request.session.has_key('user'):
        del request.session['user']
        
    auth_logout(request)
    return redirect('/')


    