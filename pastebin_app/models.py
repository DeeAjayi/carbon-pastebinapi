from django.db import models
from django.utils.timezone import now

from dateutil.relativedelta import relativedelta
from datetime import datetime

import random
import string


def generated_url():
    return ''.join(random.choices(string.ascii_letters + string.digits, k=11))


class Post(models.Model):
    name = models.CharField(max_length=150, blank=False, null=False)
    content = models.TextField(blank=False, null=False)
    generated_url = models.CharField(unique=True, editable=False, max_length=11, blank=False, null=False)
    created_on = models.DateTimeField(auto_now_add=True)
    expires_on_date = models.DateTimeField(editable=False)


    def save(self, *args, **kwargs):
        self.generated_url = generated_url()
        super(Post, self).save(*args, **kwargs)