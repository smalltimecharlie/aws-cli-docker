FROM python:alpine

ARG CLI_VERSION=1.16.112

RUN apk -uv add --no-cache groff jq less && \
    pip install --no-cache-dir awscli==$CLI_VERSION
    
RUN apk update && apk add bash    

WORKDIR /aws

CMD sh
