from datetime import datetime

from rest_framework import generics, mixins

from .models import Post
from .serializers import PostSerializer


class CreatePostAPI(generics.CreateAPIView):
    serializer_class = PostSerializer


class ListPostAPI(generics.ListAPIView):
    serializer_class = PostSerializer

    def get_queryset(self):
        return Post.objects.filter(expires_on_date__gte=datetime.now())


class RetrievePostAPI(generics.RetrieveAPIView):
    serializer_class = PostSerializer
    lookup_field = 'generated_url'

    def get_queryset(self):
        return Post.objects.filter(expires_on_date__gte=datetime.now())


class DeletePostAPI(generics.DestroyAPIView):
    serializer_class = PostSerializer
    lookup_field = 'generated_url'
    queryset = Post.objects.all()