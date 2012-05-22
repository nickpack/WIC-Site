# FlickrClient
# Copyright (c) 2004 Michele Campeotto
from wic import xmltramp
from urllib import urlencode


HOST = 'http://flickr.com'
PATH = '/services/rest/'

class FlickrError(Exception):
    def __init__(self, code, message):
        self.code = code
        self.message = message

    def __str__(self):
        return 'Flickr Error %s: %s' % (self.code, self.message)


class FlickrPhoto(object):
    def __init__(self, client, id, secret):
        self.photo = client.flickr_photos_getInfo(photo_id=id, secret=secret)
        self.description = self.getDescription()
        self.tags = self.getTags()
        self.urls = self.getURLs()
        # self.comments = self.getComments()
        self.title = self.getTitle()

    def getDescription(self):
        return unicode(self.photo.description)

    def getTags(self):
        result = []
        for tag in self.photo.tags:
            result.append(tag[0])
        return result

    def getURLs(self):
        result = []
        for url in self.photo.urls:
            result.append(url[0])
        return result

    # def getComments(self):
    #    return self.photo.comments[0]

    def getTitle(self):
        return unicode(self.photo.title)


class FlickrClient:
    def __init__(self, api_key):
        self.api_key = api_key

    def __getattr__(self, method):
        def method(_self=self, _method=method, **params):
            _method = _method.replace("_", ".")
            url = HOST + PATH + "?method=%s&%s&api_key=%s" %\
                                (_method, urlencode(params), self.api_key)
            try:
                rsp = xmltramp.load(url)
            except Exception:
                return None
            return _self._parseResponse(rsp)
        return method

    def _parseResponse(self, rsp):
        if rsp('stat') == 'fail':
            raise FlickrError(rsp.err('code'), rsp.err('msg'))

        try:
            return rsp[0]
        except Exception:
            return None

    def getPhotoInfo(self, id, secret):
        return FlickrPhoto(self, id, secret)
