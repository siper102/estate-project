FROM python:3.11-slim

RUN apt-get update && apt-get install -y curl

WORKDIR .
COPY requirements.txt ./requirements.txt

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install -r requirements.txt

COPY . ./
