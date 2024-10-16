FROM alpine:3.20.3 AS base

LABEL maintainer="pauloresendejr@gmail.com"
LABEL PICKID="PICK2024-T2"

RUN apk update && \
    apk upgrade && \
    apk add --no-cache py3-flask=3.0.3-r0 && \
    apk add --no-cache py3-redis=5.0.4-r0 && \
    apk add --no-cache py3-prometheus-client=0.20.0-r1 && \
    rm -rf /var/cache/apk/*
    
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
COPY giropops-senhas /app
WORKDIR /app 
EXPOSE 5000
ENTRYPOINT [ "python3","-m","flask","run","--host=0.0.0.0" ]
HEALTHCHECK CMD netstat -an | grep 5000 > /dev/null; if [ 0 != $? ]; then exit 1; fi;