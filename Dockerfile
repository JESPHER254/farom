FROM drupal:9.5

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    zip \
    && docker-php-ext-install zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

RUN composer create-project farmos/farmos .

RUN chown -R www-data:www-data /var/www/html/sites

EXPOSE 80
