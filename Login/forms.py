from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm

class UserRegisterForm(UserCreationForm):
    email = forms.EmailField(label='Correo Electrónico')
    username = forms.CharField(label='Nombre de Usuario')

    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']

class UserLoginForm(forms.Form):
    username_or_email = forms.CharField(label='Usuario o Correo')
    password = forms.CharField(widget=forms.PasswordInput, label='Contraseña')

