from django.conf.urls import patterns, include, url
from django.contrib import admin
from djangorestframework.views import ListOrCreateModelView
from wic.resources import *
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^admin/', include(admin.site.urls)),
    url(r'^news/(?P<slug>[^\.]+)', 'wic.views.view_article' , name='view_article'),
    url(r'^live/$', 'wic.views.gigs_index' ),
    url(r'^live/previous/$', 'wic.views.gigs_old' ),
    url(r'^gigs/(?P<slug>[^\.]+)', 'wic.views.view_gig' , name='view_gig'),
    url(r'^media/photos/$', 'wic.views.media_photos' ),
    url(r'^media/discography/$', 'wic.views.media_discography' ),
    url(r'^media/videos/$', 'wic.views.media_videos' ),
    url(r'^band/$', 'wic.views.band_index' ),
    url(r'^contact/$', 'wic.views.contact' ),
    url(r'^thanks/$', 'django.views.generic.simple.direct_to_template', {'template': 'contact-thanks.html'}),
    url(r'^$', 'wic.views.main_index' ),
    #url(r'^api/devices/$', ListOrCreateModelView.as_view(resource=DeviceTokensResource)),
    #url(r'^api/live/$', ListOrCreateModelView.as_view(resource=GigsResource)),
    #url(r'^api/photos/$', ListOrCreateModelView.as_view(resource=PhotosResource)),
    #url(r'^api/discography/$', ListOrCreateModelView.as_view(resource=DiscographyResource)),
    #url(r'^api/members/$', ListOrCreateModelView.as_view(resource=MembersResource)),
    #url(r'^api/news/$', ListOrCreateModelView.as_view(resource=NewsResource)),
    #url(r'^api/albums/$', ListOrCreateModelView.as_view(resource=AlbumsResource)),
)
