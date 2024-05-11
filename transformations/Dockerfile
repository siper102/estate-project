FROM python:3.10-alpine

WORKDIR /usr

COPY . .
# For a clean installation of pyscop2
RUN apk add --no-cache postgresql-libs && \
 apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev && \
 python3 -m pip install dbt-core dbt-postgres --no-cache-dir && \
 apk --purge del .build-deps

RUN dbt deps
