__author__ = 'Nick Pack'
from django.core.management.base import BaseCommand, CommandError
from wic.models import DeviceToken
from optparse import make_option
from django.conf import settings
from apns import APNs, Payload

class Command(BaseCommand):
    option_list = BaseCommand.option_list + (
        make_option('--debug', dest='debug',
            help='Enable debugging'),
        )

    help = 'Processes APN feedback.'

    def handle(self, *args, **options):
        """
        Handle inbound flickr photos task

        :param args: Task arguments
        :type args: :obj:`dict`
        :param options: Task CLI options
        :type options: :obj:`dict`
        """
        if options['debug'] is not None:
            self.debug = 1
        else:
            self.debug = 0

        apns = APNs(use_sandbox=True, cert_file=settings.APN_CONFIG['cert_file'], key_file=settings.APN_CONFIG['key_file'])

        for (token_hex, fail_time) in apns.feedback_server.items():
            if self.debug is 1:
                print "Expiring %s from registered device tokens." % token_hex

            DeviceToken.objects.filter(device_id=token_hex).delete()