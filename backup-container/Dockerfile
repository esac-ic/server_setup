FROM alpine:latest

COPY ./scripts/daily/backup /etc/periodic/daily/backup
RUN chmod u+x /etc/periodic/daily/backup

RUN apk update && \
    apk upgrade && \
    apk add --no-cache mysql-client && \
    rm -rf /var/cache/apk/*
