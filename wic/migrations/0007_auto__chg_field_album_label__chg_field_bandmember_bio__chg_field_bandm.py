# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):

        # Changing field 'Album.label'
        db.alter_column('wic_album', 'label', self.gf('django.db.models.fields.CharField')(max_length=255, null=True))

        # Changing field 'BandMember.bio'
        db.alter_column('wic_bandmember', 'bio', self.gf('django.db.models.fields.TextField')(null=True))

        # Changing field 'BandMember.gear'
        db.alter_column('wic_bandmember', 'gear', self.gf('django.db.models.fields.TextField')(null=True))

        # Changing field 'BandMember.avatar'
        db.alter_column('wic_bandmember', 'avatar', self.gf('sorl.thumbnail.fields.ImageField')(max_length=100, null=True))


        # Changing field 'Photo.title'
        db.alter_column('wic_photo', 'title', self.gf('django.db.models.fields.CharField')(max_length=100, null=True))
        # Adding field 'Gig.venue_pic'
        db.add_column('wic_gig', 'venue_pic',
                      self.gf('sorl.thumbnail.fields.ImageField')(max_length=100, null=True),
                      keep_default=False)

        # Adding field 'Gig.is_cancelled'
        db.add_column('wic_gig', 'is_cancelled',
                      self.gf('django.db.models.fields.BooleanField')(default=False),
                      keep_default=False)


        # Changing field 'Gig.other_bands'
        db.alter_column('wic_gig', 'other_bands', self.gf('django.db.models.fields.CharField')(max_length=255, null=True))
    def backwards(self, orm):
        # Removing unique constraint on 'NewsArticle', fields ['slug']
        db.delete_unique('wic_newsarticle', ['slug'])


        # Changing field 'Album.label'
        db.alter_column('wic_album', 'label', self.gf('django.db.models.fields.CharField')(default=datetime.datetime(2012, 5, 18, 0, 0), max_length=255))

        # Changing field 'BandMember.bio'
        db.alter_column('wic_bandmember', 'bio', self.gf('django.db.models.fields.TextField')(default='TBC'))

        # Changing field 'BandMember.gear'
        db.alter_column('wic_bandmember', 'gear', self.gf('django.db.models.fields.TextField')(default='TBC'))

        # Changing field 'NewsArticle.slug'
        db.alter_column('wic_newsarticle', 'slug', self.gf('django.db.models.fields.SlugField')(max_length=50))

        # Changing field 'Photo.title'
        db.alter_column('wic_photo', 'title', self.gf('django.db.models.fields.CharField')(default='', max_length=100))
        # Deleting field 'Gig.venue_pic'
        db.delete_column('wic_gig', 'venue_pic')

        # Deleting field 'Gig.is_cancelled'
        db.delete_column('wic_gig', 'is_cancelled')


        # Changing field 'Gig.other_bands'
        db.alter_column('wic_gig', 'other_bands', self.gf('django.db.models.fields.CharField')(default='TBC', max_length=255))
    models = {
        'wic.album': {
            'Meta': {'object_name': 'Album'},
            'cover': ('sorl.thumbnail.fields.ImageField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'label': ('django.db.models.fields.CharField', [], {'max_length': '255', 'null': 'True'}),
            'members': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['wic.BandMember']", 'symmetrical': 'False'}),
            'release_date': ('django.db.models.fields.DateField', [], {}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'tracks': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['wic.Track']", 'symmetrical': 'False'})
        },
        'wic.bandmember': {
            'Meta': {'object_name': 'BandMember'},
            'avatar': ('sorl.thumbnail.fields.ImageField', [], {'max_length': '100', 'null': 'True'}),
            'bio': ('django.db.models.fields.TextField', [], {'null': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30'}),
            'gear': ('django.db.models.fields.TextField', [], {'null': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30'}),
            'nickname': ('django.db.models.fields.CharField', [], {'max_length': '30'}),
            'role_in_band': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        },
        'wic.devicetoken': {
            'Meta': {'object_name': 'DeviceToken'},
            'date_subscribed': ('django.db.models.fields.DateField', [], {'auto_now': 'True', 'blank': 'True'}),
            'device_id': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        },
        'wic.gig': {
            'Meta': {'object_name': 'Gig'},
            'end_date': ('django.db.models.fields.DateTimeField', [], {}),
            'event_info': ('django.db.models.fields.TextField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_cancelled': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'location': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'other_bands': ('django.db.models.fields.CharField', [], {'max_length': '255', 'null': 'True'}),
            'start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'venue_pic': ('sorl.thumbnail.fields.ImageField', [], {'max_length': '100', 'null': 'True'})
        },
        'wic.newsarticle': {
            'Meta': {'object_name': 'NewsArticle'},
            'article_body': ('django.db.models.fields.TextField', [], {}),
            'article_date': ('django.db.models.fields.DateField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'posted_by': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['wic.BandMember']", 'symmetrical': 'False'}),
            'slug': ('django.db.models.fields.SlugField', [], {'unique': 'True', 'max_length': '100'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        },
        'wic.photo': {
            'Meta': {'object_name': 'Photo'},
            'flickr_id': ('django.db.models.fields.BigIntegerField', [], {}),
            'flickr_owner': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'flickr_secret': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'flickr_server': ('django.db.models.fields.IntegerField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'})
        },
        'wic.pushmessage': {
            'Meta': {'object_name': 'PushMessage'},
            'date_sent': ('django.db.models.fields.DateField', [], {'auto_now': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'message': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        },
        'wic.track': {
            'Meta': {'object_name': 'Track'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'release_date': ('django.db.models.fields.DateField', [], {}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        }
    }

    complete_apps = ['wic']
