# PASTEBIN API

## Overview

This application was built for the Carbon Platform Engineer coding challenge, it does the following:

1. It takes a texts and returns a url to the be able to access the test.
2. It takes in three parameters: 
    - Name (String)
    - Content (String)
    - Expires_on_date (dd/mm/yyyy hh:mm)
3. When the current time is greater than the expired date for a content, it is no longer available to be viewed.
4. A management command `python manage.py delete post` that can be run with a cron job to delete expired_content.
5. Local environment uses SQLite while Production environmnet uses Postgres

## Tech Stack Used
1. Python(Django) - For building the API
2. Docker, ECS, AWS - Cloud Platform
3. Terraform - IAC
4. Github Actions - CI/CD

## Instructions
In other to be able to run locally, on your commandline:
1. Run `python manage.py makemigrations && python manage.py migrate`
2. Run `python manage.py runserver`
3. The server will run on port 80, you can access it by going to "127.0.0.1:80" or "localhost:80"

To run using docker, on your commandline:
1. Run `docker build -t pastebin -f dev.dockerfile .`
2. Run `docker run -p 80:80 pastebin`

To run in a production environment:
1. Terraform can be used to create the necessary infrastructure on AWS

Production URL - pastebin-lb-tf-777316141.us-east-1.elb.amazonaws.com
