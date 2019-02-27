FROM python:alpine

ARG CLI_VERSION=1.16.112

RUN apk -uv add --no-cache groff jq less && \
    pip install --no-cache-dir awscli==$CLI_VERSION
    
RUN apk update && apk add bash    

RUN apk update && apk add inotify-tools
RUN apk add --no-cache ca-certificates

RUN apk add --no-cache python py-pip py-setuptools ca-certificates libmagic
RUN pip install python-dateutil python-magic

ARG S3CMD_CURRENT_VERSION=2.0.2
ENV S3CMD_CURRENT_VERSION=$S3CMD_CURRENT_VERSION

RUN mkdir -p /opt \
    && wget https://github.com/s3tools/s3cmd/releases/download/v${S3CMD_CURRENT_VERSION}/s3cmd-${S3CMD_CURRENT_VERSION}.zip \
    && unzip s3cmd-${S3CMD_CURRENT_VERSION}.zip -d /opt/
RUN ln -s /opt/s3cmd-${S3CMD_CURRENT_VERSION}/s3cmd /usr/bin/s3cmd

RUN sh configure_s3cmd.sh

ENV ENV="/etc/profile"
ADD bin/update.sh /etc/profile.d/

WORKDIR /tmp

WORKDIR /aws

CMD sh
