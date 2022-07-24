FROM php:8.0-fpm

RUN apt-get update && apt-get install -y libmagickwand-dev libmagickcore-dev libzip-dev libwebp-dev

RUN docker-php-ext-install exif \
  && pecl install imagick && docker-php-ext-enable imagick \
  && docker-php-ext-install mysqli && docker-php-ext-enable mysqli \
  && PHP_OPENSSL=yes \
  && docker-php-ext-install xml \
  && docker-php-ext-install filter \
  && docker-php-ext-install zip \
  && docker-php-ext-install bcmath \
  && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
  && docker-php-ext-install gd \
  && docker-php-ext-install intl