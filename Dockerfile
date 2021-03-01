FROM python:3.8-slim

# install git
RUN apt-get update &&\
    apt-get -qq -y install bash git openssh build-essential python3-dev

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
