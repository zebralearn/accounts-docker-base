FROM php:8.2-cli-alpine AS runtime

LABEL maintainer="Zebralearn DevOps <devops@zebralearn.com>"

# Install core runtime utilities and tini
RUN apk add --no-cache \
    bash \
    ca-certificates \
    tini \
    postgresql-client

# Install the docker-php-extension-installer tool
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# Install required PHP extensions for Laravel, Octane, Redis, and Kafka
RUN install-php-extensions \
    swoole \
    redis \
    rdkafka \
    pdo_mysql \
    pdo_pgsql \
    pcntl \
    bcmath \
    gd \
    zip \
    intl \
    opcache \
    exif



