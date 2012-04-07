__author__ = 'Nick Pack'
from django.core.urlresolvers import reverse
from djangorestframework.resources import ModelResource
from wic.models import *

class GigsResource(ModelResource):
    """
    Simple API resource for gigs
    """
    model = Gig
    ordering = ('start_date',)

class MembersResource(ModelResource):
    """
    Simple API resource for band members
    """
    model = BandMember
    ordering = ('nickname',)

class AlbumsResource(ModelResource):
    model = Album
    ordering = ('release_date')
