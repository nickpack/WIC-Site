__author__ = 'Nick Pack'
from wic.models import *
from django.contrib import admin
from imagekit.admin import AdminThumbnail

class PhotoAdmin(admin.ModelAdmin):
    list_display = ('__str__', 'admin_thumbnail')
    admin_thumbnail = AdminThumbnail(image_field='thumbnail')


admin.site.register(Photo)
admin.site.register(Gig)
admin.site.register(BandMember)
admin.site.register(Album)
admin.site.register(Track)
admin.site.register(NewsArticle)