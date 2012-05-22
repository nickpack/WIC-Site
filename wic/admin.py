__author__ = 'Nick Pack'
from wic.models import *
from django.contrib import admin

class NewsArticleAdmin(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("title",)}

admin.site.register(Photo)
admin.site.register(Gig)
admin.site.register(BandMember)
admin.site.register(Album)
admin.site.register(Track)
admin.site.register(NewsArticle, NewsArticleAdmin)