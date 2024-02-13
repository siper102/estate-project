FROM python:3.11-alpine

WORKDIR /usr

COPY . .
RUN pip install --upgrade pip
RUN pip install dbt-postgres

RUN dbt deps
