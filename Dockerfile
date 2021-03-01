FROM python:3.8-alpine3.12

# install git
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh build-base python3-dev

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
