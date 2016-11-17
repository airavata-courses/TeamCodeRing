FROM ubuntu:latest
MAINTAINER Prashanth Murali "prashanthkumarmurali@gmail.com"
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
COPY ./requirements.txt /app/requirements.txt
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
RUN pip install uwsgi
ENV FLASK_APP=application.py
EXPOSE 5000
ENTRYPOINT ["uwsgi", "--http", "0.0.0.0:5000", "--module", "application:app", "--processes", "1", "--threads", "8"]