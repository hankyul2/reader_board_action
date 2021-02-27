FROM python:3.8-alpine3.12

# install git
RUN apk -y update \
    apk -y --no-cache add git

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
