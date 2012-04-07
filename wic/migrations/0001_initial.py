# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'BandMember'
        db.create_table('wic_bandmember', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('nickname', self.gf('django.db.models.fields.CharField')(max_length=30)),
            ('first_name', self.gf('django.db.models.fields.CharField')(max_length=30)),
            ('last_name', self.gf('django.db.models.fields.CharField')(max_length=30)),
            ('role_in_band', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('bio', self.gf('django.db.models.fields.TextField')()),
            ('gear', self.gf('django.db.models.fields.TextField')()),
            ('avatar', self.gf('django.db.models.fields.files.FileField')(max_length=100)),
        ))
        db.send_create_signal('wic', ['BandMember'])

        # Adding model 'Gig'
        db.create_table('wic_gig', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('event_info', self.gf('django.db.models.fields.TextField')()),
            ('start_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('end_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('location', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('other_bands', self.gf('django.db.models.fields.CharField')(max_length=255)),
        ))
        db.send_create_signal('wic', ['Gig'])

        # Adding model 'Track'
        db.create_table('wic_track', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('release_date', self.gf('django.db.models.fields.DateField')()),
        ))
        db.send_create_signal('wic', ['Track'])

        # Adding model 'Album'
        db.create_table('wic_album', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('release_date', self.gf('django.db.models.fields.DateField')()),
            ('label', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('cover', self.gf('django.db.models.fields.files.FileField')(max_length=100)),
        ))
        db.send_create_signal('wic', ['Album'])

        # Adding M2M table for field members on 'Album'
        db.create_table('wic_album_members', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('album', models.ForeignKey(orm['wic.album'], null=False)),
            ('bandmember', models.ForeignKey(orm['wic.bandmember'], null=False))
        ))
        db.create_unique('wic_album_members', ['album_id', 'bandmember_id'])

        # Adding M2M table for field tracks on 'Album'
        db.create_table('wic_album_tracks', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('album', models.ForeignKey(orm['wic.album'], null=False)),
            ('track', models.ForeignKey(orm['wic.track'], null=False))
        ))
        db.create_unique('wic_album_tracks', ['album_id', 'track_id'])

        # Adding model 'DeviceToken'
        db.create_table('wic_devicetoken', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('device_id', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('date_subscribed', self.gf('django.db.models.fields.DateField')(auto_now=True, blank=True)),
        ))
        db.send_create_signal('wic', ['DeviceToken'])

        # Adding model 'PushMessage'
        db.create_table('wic_pushmessage', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('message', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('date_sent', self.gf('django.db.models.fields.DateField')(auto_now=True, blank=True)),
        ))
        db.send_create_signal('wic', ['PushMessage'])

        # Adding M2M table for field device_id on 'PushMessage'
        db.create_table('wic_pushmessage_device_id', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('pushmessage', models.ForeignKey(orm['wic.pushmessage'], null=False)),
            ('devicetoken', models.ForeignKey(orm['wic.devicetoken'], null=False))
        ))
        db.create_unique('wic_pushmessage_device_id', ['pushmessage_id', 'devicetoken_id'])

        # Adding model 'NewsArticle'
        db.create_table('wic_newsarticle', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('article_date', self.gf('django.db.models.fields.DateField')()),
            ('article_body', self.gf('django.db.models.fields.TextField')()),
        ))
        db.send_create_signal('wic', ['NewsArticle'])

        # Adding M2M table for field posted_by on 'NewsArticle'
        db.create_table('wic_newsarticle_posted_by', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('newsarticle', models.ForeignKey(orm['wic.newsarticle'], null=False)),
            ('bandmember', models.ForeignKey(orm['wic.bandmember'], null=False))
        ))
        db.create_unique('wic_newsarticle_posted_by', ['newsarticle_id', 'bandmember_id'])

        # Adding model 'Photo'
        db.create_table('wic_photo', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=100, blank=True)),
            ('flickr_id', self.gf('django.db.models.fields.IntegerField')()),
            ('flickr_owner', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('flickr_server', self.gf('django.db.models.fields.IntegerField')()),
            ('flickr_secret', self.gf('django.db.models.fields.CharField')(max_length=50)),
        ))
        db.send_create_signal('wic', ['Photo'])

    def backwards(self, orm):
        # Deleting model 'BandMember'
        db.delete_table('wic_bandmember')

        # Deleting model 'Gig'
        db.delete_table('wic_gig')

        # Deleting model 'Track'
        db.delete_table('wic_track')

        # Deleting model 'Album'
        db.delete_table('wic_album')

        # Removing M2M table for field members on 'Album'
        db.delete_table('wic_album_members')

        # Removing M2M table for field tracks on 'Album'
        db.delete_table('wic_album_tracks')

        # Deleting model 'DeviceToken'
        db.delete_table('wic_devicetoken')

        # Deleting model 'PushMessage'
        db.delete_table('wic_pushmessage')

        # Removing M2M table for field device_id on 'PushMessage'
        db.delete_table('wic_pushmessage_device_id')

        # Deleting model 'NewsArticle'
        db.delete_table('wic_newsarticle')

        # Removing M2M table for field posted_by on 'NewsArticle'
        db.delete_table('wic_newsarticle_posted_by')

        # Deleting model 'Photo'
        db.delete_table('wic_photo')

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
            'flickr_id': ('django.db.models.fields.IntegerField', [], {}),
            'flickr_owner': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'flickr_secret': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'flickr_server': ('django.db.models.fields.IntegerField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '100', 'blank': 'True'})
        },
        'wic.pushmessage': {
            'Meta': {'object_name': 'PushMessage'},
            'date_sent': ('django.db.models.fields.DateField', [], {'auto_now': 'True', 'blank': 'True'}),
            'device_id': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['wic.DeviceToken']", 'symmetrical': 'False'}),
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