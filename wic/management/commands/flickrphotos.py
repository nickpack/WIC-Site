__author__ = 'Nick Pack'
from django.core.management.base import BaseCommand, CommandError
from wic.models import Photo
from optparse import make_option
from wic.flickrclient import *

class Command(BaseCommand):
    option_list = BaseCommand.option_list + (
        make_option('--debug', dest='debug',
            help='Enable debugging'),
        )

    help = 'Fetches flickr photos.'

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

        API_KEY = '202674dc858dc950b7589847eb7754ab'
        USER_ID = '53127318@N08'

        cur_page = 1            # Start on the first page of the stream
        paginate_by = 20        # Get 20 photos at a time
        dupe = False            # Set our dupe flag for the following loop

        client = FlickrClient(API_KEY)          # Get our flickr client running

        while cur_page is not None:
            photos = client.flickr_people_getPublicPhotos(user_id=USER_ID, page=cur_page, per_page=paginate_by)

            for photo in photos:
                try:
                    row = Photo.objects.get(flickr_id=photo("id"), flickr_secret=str(photo("secret")))
                    if self.debug is not 0:
                        print "Photo already indexed: %s" % photo("id")
                    dupe = True
                except Photo.DoesNotExist:
                    if self.debug is not 0:
                        print "Adding: %s" % photo("id")

                    p = Photo(
                        title = str(photo("title")),
                        flickr_id = int(photo("id")),
                        flickr_owner = str(photo("owner")),
                        flickr_server = int(photo("server")),
                        flickr_secret = str(photo("secret")),
                    )
                    p.save()

                    if dupe:
                        continue

            if photos("page") == photos("pages"):   # If we hit a dupe or if we did the last page...
                cur_page = None
            else:
                cur_page += 1