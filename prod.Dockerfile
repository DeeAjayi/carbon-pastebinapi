FROM python:3.8-slim-buster

ENV PYTHONUNBUFFERED=1

ENV DJANGO_DEBUG=False

ARG SECRETKEY
ARG DJANGOSETTINGSMODULE
ARG DJANGO_WSGI_SETTINGS_MODULE

ENV DJANGO_SECRET_KEY=$SECRETKEY

ENV DJANGO_SETTINGS_MODULE=$DJANGOSETTINGSMODULE

ENV DJANGO_WSGI_SETTINGS_MODULE=$DJANGO_WSGI_SETTINGS_MODULE

WORKDIR /code

COPY requirements.txt /code/

RUN pip install -r requirements.txt

COPY pastebin_app /code/pastebin_app

COPY manage.py /code/

EXPOSE 80

RUN python manage.py makemigrations && python manage.py migrate

ENTRYPOINT [ "python", "manage.py" ]

CMD [ "runserver", "0.0.0.0:80" ]

