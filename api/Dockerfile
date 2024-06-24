FROM ubuntu:22.04

WORKDIR .
RUN apt update && apt install -y --no-install-recommends gcc python3 python3-dev python3-pip curl
COPY requirements.txt ./requirements.txt

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install -r requirements.txt

COPY . ./
