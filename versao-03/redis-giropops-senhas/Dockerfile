FROM cgr.dev/chainguard/wolfi-base:latest

LABEL maintainer="pauloresendejr@gmail.com"
LABEL pickid="PICK2024-T2"

RUN apk update && \
    apk upgrade && \
    apk add --no-cache redis=7.2.5-r1 && \
    rm -rf /var/cache/apk/*

EXPOSE 6379

ENTRYPOINT [ "redis-server", "--protected-mode no"]

HEALTHCHECK CMD netstat -an | grep 6379 > /dev/null; if [ 0 != $? ]; then exit 1; fi;