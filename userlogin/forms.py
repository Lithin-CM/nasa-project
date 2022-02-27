from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import extends

class createUserForm(UserCreationForm):
    
    class Meta:
        model =extends
        fields =['username','email', 'phonenum']

    def clean(self):
        cleaned_data = super(createUserForm, self).clean()
        email = cleaned_data.get("email")
        


        if email =='':
            self.add_error('email', "this field is required")
        

        return cleaned_data

class CreateLoginForm(forms.Form):
    username =forms.CharField()
    password =forms.CharField(widget=forms.PasswordInput())