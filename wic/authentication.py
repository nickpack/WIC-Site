__author__ = 'packn'

from django.contrib.auth.models import User
from djangorestframework.authentication import BaseAuthentication

class APIAuth(BaseAuthentication):
    """
    API authentication for all APIs
    """
    def authenticate(self, request):
        """
        Authenticate requests by a specific header

        :param request: Django request object
        :type request: :obj:`Request`
        :return: A valid user object if successful, None if fail
        :rtype: :obj:`User` on success, None on fail
        """
        # and request.META['APIKey'] == "wicd1r7y5ou7hwic"
        if 'APIKey' in request.META:
            return User(username='API', password='WTFDYW', email='api@walkincoma.co.uk')
        else:
            return None
