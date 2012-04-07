from django.shortcuts import render_to_response
from django.template import Context, loader
from wic.models import *
from django.http import HttpResponse
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