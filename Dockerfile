FROM python:3.10-alpine

ENV PYTHONUNBUFFERED 1

RUN apk update && \
apk add --no-cache --virtual build-deps gcc python3-dev musl-dev && \
apk add postgresql-dev

COPY ./requerimiento.txt ./requerimiento.txt
RUN pip install -r /requerimiento.txt

RUN mkdir /app
WORKDIR /app
COPY /app /app

RUN adduser -D user
USER user
EXPOSE 8000