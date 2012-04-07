__author__ = 'Nick Pack'
from django.db import models

class BandMember(models.Model):
    nickname = models.CharField(max_length=30)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    role_in_band = models.CharField(max_length=255)
    bio = models.TextField()
    gear = models.TextField()
    avatar = models.FileField(upload_to='avatars')

    def __unicode__(self):
        return self.last_name

class Gig(models.Model):
    title = models.CharField(max_length=255)
    event_info = models.TextField()
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()
    location = models.CharField(max_length=255)
    other_bands = models.CharField(max_length=255)

    def __unicode__(self):
        return self.title

class Track(models.Model):
    title = models.CharField(max_length=255)
    release_date = models.DateField()

    def __unicode__(self):
        return self.title

class Album(models.Model):
    title = models.CharField(max_length=255)
    release_date = models.DateField()
    label = models.CharField(max_length=255)
    members = models.ManyToManyField(BandMember)
    tracks = models.ManyToManyField(Track)
    cover = models.FileField(upload_to='albums')

    def __unicode__(self):
        return self.title

class DeviceToken(models.Model):
    device_id = models.CharField(max_length=255)
    date_subscribed = models.DateField(auto_now=True, editable=False)

    def __unicode__(self):
        return self.device_id

class PushMessage(models.Model):
    device_id = models.ManyToManyField(DeviceToken)
    message = models.CharField(max_length=255)
    date_sent = models.DateField(auto_now=True, editable=False)

    def __unicode__(self):
        return self.message

class NewsArticle(models.Model):
    title = models.CharField(max_length=255)
    article_date = models.DateField()
    posted_by = models.ManyToManyField(BandMember)
    article_body = models.TextField()

class Photo(models.Model):
    title = models.CharField(blank=True, max_length=100)
    flickr_id = models.BigIntegerField()
    flickr_owner = models.CharField(max_length=20)
    flickr_server = models.IntegerField()
    flickr_secret = models.CharField(max_length=50)

    class Admin:
        list_display = ('title',)

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return "/photos/%s/" % self.id

