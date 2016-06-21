FROM resin/beaglebone-alpine-python:slim

# Enable OpenRC
ENV INITSYSTEM on

# Defines our working directory in container
WORKDIR /usr/src/app

# Install linux headers on Alpine (including some packages from `build-base`)
#RUN apk add --update linux-headers git gcc libc-dev
RUN apk add --update linux-headers git build-base
RUN apk add py-smbus --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

# Copy requirements.txt first for better cache on later pushes
COPY ./requirements.txt /requirements.txt

# pip install python deps from requirements.txt on the resin.io build server
RUN pip install -U pip \
    && pip install -r /requirements.txt

# This will copy all files in our root to the working  directory in the container
COPY . ./

# main.py will run when container starts up on the device
CMD ["python","src/bmp180.py"]
