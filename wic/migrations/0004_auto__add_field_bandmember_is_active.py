# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding field 'BandMember.is_active'
        db.add_column('wic_bandmember', 'is_active',
                      self.gf('django.db.models.fields.BooleanField')(default=False),
                      keep_default=False)

    def backwards(self, orm):
        # Deleting field 'BandMember.is_active'
        db.delete_column('wic_bandmember', 'is_active')

    models = {
        'wic.album': {
            'Meta': {'object_name': 'Album'},
            'cover': ('django.db.models.fields.files.FileField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'label': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'members': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['wic.BandMember']", 'symmetrical': 'False'}),
            'release_date': ('django.db.models.fields.DateField', [], {}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'tracks': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['wic.Track']", 'symmetrical': 'False'})
        },
        'wic.bandmember': {
            'Meta': {'object_name': 'BandMember'},
            'avatar': ('django.db.models.fields.files.FileField', [], {'max_length': '100'}),
            'bio': ('django.db.models.fields.TextField', [], {}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30'}),
            'gear': ('django.db.models.fields.TextField', [], {}),
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
            'location': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'other_bands': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        },
        'wic.newsarticle': {
            'Meta': {'object_name': 'NewsArticle'},
            'article_body': ('django.db.models.fields.TextField', [], {}),
            'article_date': ('django.db.models.fields.DateField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'posted_by': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['wic.BandMember']", 'symmetrical': 'False'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        },
        'wic.photo': {
            'Meta': {'object_name': 'Photo'},
            'flickr_id': ('django.db.models.fields.BigIntegerField', [], {}),
            'flickr_owner': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'flickr_secret': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'flickr_server': ('django.db.models.fields.IntegerField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '100', 'blank': 'True'})
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