FROM drupal:9.5

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    zip \
    && docker-php-ext-install zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Removed the composer line that caused the error

RUN chown -R www-data:www-data /var/www/html/sites

EXPOSE 80
