FROM alpine:3.20.3 AS base
LABEL maintainer="pauloresendejr@gmail.com"
RUN apk update && \
    apk upgrade && \
    apk add --no-cache py3-flask=3.0.3-r0 && \
    apk add --no-cache py3-redis=5.0.4-r0 && \
    apk add --no-cache py3-prometheus-client=0.20.0-r1 && \
    apk add --no-cache redis=7.2.5-r1 && \
    rm -rf /var/cache/apk/*

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
COPY giropops-senhas /app
WORKDIR /app 
ENV REDIS_HOST=localhost
EXPOSE 5000
COPY entrypoint.sh .
ENTRYPOINT [ "/bin/sh","entrypoint.sh" ]

HEALTHCHECK CMD netstat -an | grep 5000 > /dev/null; if [ 0 != $? ]; then exit 1; fi;