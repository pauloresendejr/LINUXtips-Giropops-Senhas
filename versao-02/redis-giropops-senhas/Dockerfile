FROM alpine:3.20.3 AS base

LABEL maintainer="pauloresendejr@gmail.com"
LABEL pickid="PICK2024-T2"

RUN apk update && \
    apk upgrade && \
    apk add --no-cache redis=7.2.5-r1 && \
    sed -i "s/bind 127.0.0.1 -::1/bind * -::*/g" /etc/redis.conf && \
    rm -rf /var/cache/apk/*

EXPOSE 6379

ENTRYPOINT [ "redis-server", "--protected-mode no"]

HEALTHCHECK CMD netstat -an | grep 6379 > /dev/null; if [ 0 != $? ]; then exit 1; fi;