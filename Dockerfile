FROM php:7.4-cli
# uses 
# - debian stretch: 9.6-slim 
# - node: 10.15.0
# - python: Python/3.5.3

ARG AWS_CLI_VERSION=1.16.106

USER root

RUN apt-get update && \
    apt-get --no-install-recommends install -y python3 python3-pip python3-setuptools groff less && \
    pip3 install --upgrade pip && \
    apt-get clean && \
    apt-get install xvfb libgtk-3-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2
RUN pip3 --no-cache-dir install --upgrade awscli==${AWS_CLI_VERSION}

RUN apt-get update && apt-get --no-install-recommends install -y libgmp-dev libxml2-dev zlib1g-dev libpng-dev libsqlite3-dev libonig-dev libgcrypt-dev libgpg-error-dev
RUN docker-php-ext-install gmp mbstring mysqli pdo_mysql soap gd bcmath && \
    docker-php-ext-configure gmp
RUN apt-get clean
