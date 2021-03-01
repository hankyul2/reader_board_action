FROM python:3.8-slim

# install git
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install --no-cache -y bash git openssh build-essential python3-dev

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
