FROM php:8.4-cli-alpine AS runtime

LABEL maintainer="Zebralearn DevOps <developer@zebralearn.com>"

# Install core runtime utilities and prebuilt PHP 8.4 packages.
# This avoids compiling heavy extensions on ARM.
RUN apk add --no-cache \
    bash \
    ca-certificates \
    tini \
    postgresql-client \
    php84 \
    php84-fpm \
    php84-pdo \
    php84-pdo_mysql \
    php84-pdo_pgsql \
    php84-pcntl \
    php84-bcmath \
    php84-gd \
    php84-zip \
    php84-intl \
    php84-opcache \
    php84-exif \
    php84-pecl-redis \
    php84-pecl-swoole \
    php84-pecl-rdkafka \
    php84-pecl-mongodb \
    php84-pecl-grpc \
    php84-dom \
    php84-tokenizer \
    php84-xml \
    php84-simplexml \
    php84-xmlwriter \
    php84-xmlreader \
    php84-fileinfo

RUN ln -sf /usr/bin/php84 /usr/local/bin/php

ENTRYPOINT ["tini", "--"]
CMD ["php", "-v"]



