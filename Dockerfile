FROM resin/beaglebone-python:latest

ENV INITSYSTEM on

# Defines our working directory in container
WORKDIR /usr/src/app

# Add dependencies
RUN apt-get update && \
    apt-get install -yq --no-install-recommends git build-essential python-smbus && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy requirements.txt first for better cache on later pushes
COPY ./requirements.txt /requirements.txt

# pip install python deps from requirements.txt on the resin.io build server
RUN pip install -r /requirements.txt

# Remove build dependencies
RUN apt-get purge git build-essential

# This will copy all files in our root to the working  directory in the container
COPY . ./

# main.py will run when container starts up on the device
CMD ["python","src/bmp180.py"]
