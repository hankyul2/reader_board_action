FROM python:3.8-alpine3.12

# install git
RUN apt-get -y update \
    apt-get -y install git

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
