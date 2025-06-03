# Dockerfile
# Use the official PHP 8.2 + Apache image
FROM php:8.2-apache

# Install required packages and PHP extensions for osTicket
# RUN apt-get update && apt-get install -y \
#     libpng-dev libjpeg-dev libfreetype6-dev \
#     libonig-dev unzip \
#   && docker-php-ext-configure gd --with-freetype --with-jpeg \
#   && docker-php-ext-install gd mysqli

RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev \
    libicu-dev \
    libc-client-dev libkrb5-dev \
    libxml2-dev \
    unzip \
  && docker-php-ext-configure gd --with-freetype --with-jpeg \
  # IMAP requires a special configure step with Kerberos
  && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
  # Install base extensions
  && docker-php-ext-install gd mysqli intl imap ctype \
  # Enable OPcache (built into php:8.2-apache, but not always enabled by default)
  && docker-php-ext-install opcache \
  && docker-php-ext-enable opcache

# Enable Apache rewrite module (used by osTicket's friendly URLs, etc.)
RUN a2enmod rewrite

# Set environment variables to define the osTicket version to download
ENV OSTICKET_VERSION=1.17.6
ENV OSTICKET_DOWNLOAD_URL=https://github.com/osTicket/osTicket/releases/download/v1.17.6/osTicket-v1.17.6.zip

WORKDIR /var/www/html

# Download and extract osTicket
RUN curl -sSL $OSTICKET_DOWNLOAD_URL -o osticket.zip \
  && unzip osticket.zip \
  && rm osticket.zip \
  && mv upload/* . \
  && rmdir upload

# Adjust file permissions for www-data
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

EXPOSE 80
