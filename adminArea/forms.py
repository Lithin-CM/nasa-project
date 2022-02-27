from django import forms
from django.contrib.auth.forms import UserCreationForm
from adminArea import models
from theatreArea.models import theatres

class theatreForm(forms.ModelForm):
  
    class Meta:
        model =theatres
        fields =['username','owner_name','theatre_name','location','email', 'phone','password','location_url']

    def clean(self):
        cleaned_data = super(theatreForm, self).clean()
        email = cleaned_data.get("email")
        


        if email =='':
            self.add_error('email', "this field is required")
        

        return cleaned_data