from datetime import datetime

from django.core.management.base import BaseCommand, CommandError

from pastebin_app.models import Post


class Command(BaseCommand):
    help = 'Delete expired posts'

    def handle(self, *args, **options):
        Post.objects.filter(expires_on_date__lte=datetime.now()).delete()