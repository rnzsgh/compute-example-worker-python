# This is a multi-stage build. First we are going to compile and then
# create a small image for runtime.
ARG ACCOUNT_ID
FROM ${ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com/docker-python-base:latest

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "-u", "./test.py" ]
