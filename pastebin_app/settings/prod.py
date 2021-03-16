import os

from .base import *

DEBUG = bool(os.getenv('DJANGO_DEBUG', ''))

SECRET_KEY = os.getenv('DJANGO_SECRET_KEY', '')

ALLOWED_HOSTS = ['*']