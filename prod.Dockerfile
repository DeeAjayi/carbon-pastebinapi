FROM python:3.8-slim-buster

ENV PYTHONUNBUFFERED=1

ENV DJANGO_DEBUG=False

ARG SECRETKEY
ARG DJANGOSETTINGSMODULE
ARG DJANGO_WSGI_SETTINGS_MODULE

ARG DB_NAME
ARG DB_USER
ARG DB_HOST
ARG DB_PORT
ARG DB_SECRET_KEY

ENV DJANGO_SECRET_KEY=$SECRETKEY

ENV DJANGO_SETTINGS_MODULE=$DJANGOSETTINGSMODULE

ENV DJANGO_WSGI_SETTINGS_MODULE=$DJANGO_WSGI_SETTINGS_MODULE

ENV DB_NAME=$DB_NAME
ENV DB_USER=$DB_USER
ENV DB_HOST=$DB_HOST
ENV DB_PORT=$DB_PORT
ENV DB_SECRET_KEY=$DB_SECRET_KEY

WORKDIR /code

COPY requirements.txt /code/

RUN pip install -r requirements.txt

COPY pastebin_app /code/pastebin_app

COPY manage.py /code/

EXPOSE 80

RUN python manage.py makemigrations && python manage.py migrate

ENTRYPOINT [ "python", "manage.py" ]

CMD [ "runserver", "0.0.0.0:80" ]

