from datetime import datetime
from rest_framework import serializers

from .models import Post


class PostSerializer(serializers.ModelSerializer):
    expires_on_date = serializers.DateTimeField(allow_null=True)
    class Meta:
        model = Post
        fields = ['name', 'content', 'generated_url', 'created_on', 'expires_on_date']
   