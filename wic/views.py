from django.shortcuts import render_to_response
from django.template import Context, loader
from wic.models import *
from wic.forms import *
from django.http import HttpResponse, HttpResponseRedirect
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

def main_index(request):
    news_articles = NewsArticle.objects.all().order_by('-article_date')
    paginator = Paginator(news_articles, 5)

    page = request.GET.get('page')
    try:
        articles = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        articles = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        articles = paginator.page(paginator.num_pages)

    return render_to_response('index.html', {"articles": articles})

def band_index(request):
    members = BandMember.objects.all()
    t = loader.get_template('band/index.html')
    c = Context({
        'members': members,
    })
    return HttpResponse(t.render(c))

def gigs_index(request):
    gig_list = Gig.objects.all().order_by('start_date')
    t = loader.get_template('gigs/index.html')
    c = Context({
        'gig_list': gig_list,
    })
    return HttpResponse(t.render(c))

def band_index(request):
    band_members = BandMember.objects.all().order_by('nickname')
    t = loader.get_template('band/index.html')
    c = Context({
        'members': band_members,
        })
    return HttpResponse(t.render(c))

def media_index(request):
    photos = Photo.objects.all()
    paginator = Paginator(photos, 20)

    page = request.GET.get('page')
    try:
        pics = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        pics = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        pics = paginator.page(paginator.num_pages)

    return render_to_response('media/index.html', {"photos": pics})

def contact(request):
    if request.method == 'POST': # If the form has been submitted...
        form = ContactForm(request.POST) # A form bound to the POST data
        if form.is_valid():
            subject = form.cleaned_data['subject']
            message = form.cleaned_data['message']
            sender = form.cleaned_data['sender']
            cc_myself = form.cleaned_data['cc_myself']

            recipients = ['walkincoma@hotmail.co.uk']
            if cc_myself:
                recipients.append(sender)

            from django.core.mail import send_mail
            send_mail(subject, message, sender, recipients)
            return HttpResponseRedirect('/thanks/')
    else:
        form = ContactForm() # An unbound form

    return render_to_response('contact.html', {
        'form': form,
    })