FROM php:8.2-fpm

RUN apt-get update && apt-get install -y nginx
RUN apt-get install -y git

COPY config/default.conf /etc/nginx/sites-available/default

# Install composer (updated via entry point)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy source code
COPY . /var/www/html

# Run composer install
RUN composer install

# Start nginx and php-fpm
CMD php-fpm -D && nginx -g 'daemon off;'