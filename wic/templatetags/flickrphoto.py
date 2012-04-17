__author__ = 'Nick Pack'
from django import template

register = template.Library()

@register.filter(name='flickrurl')
def get_pic_url(self, size='small_square'):
    # small_square=75x75
    # thumb=100 on longest side
    # small=240 on longest side
    # medium=500 on longest side
    # large=1024 on longest side
    # original=duh

    base_url = "http://static.flickr.com"
    size_char='_s'  # default to small_square

    if size == 'small_square':
        size_char='_s'
    elif size == 'thumb':
        size_char='_t'
    elif size == 'small':
        size_char='_m'
    elif size == 'medium':
        size_char=''
    elif size == 'large':
        size_char='_b'
    elif size == 'original':
        size_char='_o'

    return "%s/%s/%s_%s%s.jpg" % (base_url, self.flickr_server, self.flickr_id, self.flickr_secret, size_char)