FROM python:3.8-slim

# install git
RUN apt-get update && apt-get upgrade && \
    apt-get install --no-cache -y bash git openssh build-base libxml2-dev libxslt1-dev python3-dev

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
