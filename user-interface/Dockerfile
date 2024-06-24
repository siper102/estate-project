FROM python:3.11-slim

WORKDIR /src/app
COPY requirements.txt /src/app/requirements.txt

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install -r requirements.txt

COPY . ./
