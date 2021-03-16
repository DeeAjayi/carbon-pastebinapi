from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.ListPostAPI.as_view(), name='list_posts'),
    path('create/', views.CreatePostAPI.as_view(), name='create_post'),
    path('<str:generated_url>/', views.RetrievePostAPI.as_view(), name='show_post'),
    path('<str:generated_url>/delete', views.DeletePostAPI.as_view(), name='delete_post')
]