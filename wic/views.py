import datetime
from django.shortcuts import render_to_response, get_object_or_404
from django.template import Context, loader
from django.template.context import RequestContext
from wic.models import *
from wic.forms import *
from django.http import HttpResponse, HttpResponseRedirect
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

def main_index(request):
    news_articles = NewsArticle.objects.all().order_by('-article_date')
    paginator = Paginator(news_articles, 8)

    page = request.GET.get('page')
    try:
        articles = paginator.page(page)
    except PageNotAnInteger:
        articles = paginator.page(1)
    except EmptyPage:
        articles = paginator.page(paginator.num_pages)

    return render_to_response( 'index.html' , {"articles": articles})

def view_article(request, slug):
    news_articles = NewsArticle.objects.all().order_by('-article_date')
    paginator = Paginator(news_articles, 8)
    articles = paginator.page(1)
    return render_to_response( 'newsarticle.html' , {
        'post': get_object_or_404(NewsArticle, slug=slug),
        'articles': articles
    })

def view_gig(request, slug):
    post = get_object_or_404(Gig, slug=slug)
    return render_to_response( 'gigs/index.html' , {'post': post, } )

def band_index(request):
    members = BandMember.objects.filter(is_active=True)
    t = loader.get_template( 'band/index.html' )
    c = Context({
        'members': members,
    })
    return HttpResponse(t.render(c))

def gigs_index(request):
    gig_list = Gig.objects.filter(end_date__gte=datetime.date.today()).order_by('start_date')
    t = loader.get_template( 'gigs/index.html' )
    c = Context({
        'gig_list': gig_list,
    })
    return HttpResponse(t.render(c))

def gigs_old(request):
    gig_list = Gig.objects.filter(end_date__lt=datetime.date.today()).order_by('start_date')
    t = loader.get_template( 'gigs/previous.html' )
    c = Context({
        'gig_list': gig_list,
        })
    return HttpResponse(t.render(c))

def band_index(request):
    band_members = BandMember.objects.all().order_by('first_name')
    t = loader.get_template( 'band/index.html' )
    c = Context({
        'members': band_members,
        })
    return HttpResponse(t.render(c))

def media_photos(request):
    photos = Photo.objects.all().order_by('-flickr_id')
    paginator = Paginator(photos, 27)

    page = request.GET.get('page')
    try:
        pics = paginator.page(page)
    except PageNotAnInteger:
        pics = paginator.page(1)
    except EmptyPage:
        pics = paginator.page(paginator.num_pages)

    return render_to_response( 'media/photos.html' , {"photos": pics})

def media_discography(request):
    albums = Album.objects.all().order_by('-release_date')

    t = loader.get_template( 'media/discography.html' )
    c = Context({
        'albums': albums,
        })
    return HttpResponse(t.render(c))

def media_videos(request):
    t = loader.get_template( 'media/videos.html' )
    c = Context({})
    return HttpResponse(t.render(c))

def contact(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            subject = form.cleaned_data['subject']
            message = form.cleaned_data['message']
            sender = form.cleaned_data['sender']

            recipients = ['walkincoma@hotmail.co.uk']

            from django.core.mail import send_mail
            send_mail(subject, message, sender, recipients)
            return HttpResponseRedirect('/thanks/')
    else:
        form = ContactForm()

    return render_to_response( 'contact.html' , {
        'form': form,
    }, context_instance=RequestContext(request))