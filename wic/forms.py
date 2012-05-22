__author__ = 'Nick Pack'
from django import forms

class ContactForm(forms.Form):
    subject = forms.CharField(max_length=100)
    message = forms.CharField(widget=forms.widgets.Textarea())
    sender = forms.EmailField()