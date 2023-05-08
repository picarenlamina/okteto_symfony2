# Use an official PHP runtime as a parent image
FROM php:7.4-apache

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Install required PHP extensions
RUN docker-php-ext-install pdo pdo_mysql opcache

# Enable Apache's mod_rewrite
RUN a2enmod rewrite

# Copy composer files and install dependencies
#COPY composer.json composer.lock ./
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && composer install --no-dev --prefer-dist --no-scripts --no-progress --no-suggest --optimize-autoloader

# Copy the rest of the application source code
COPY . .

# Set the ownership and permissions of files and directories
#RUN chown -R www-data:www-data var \
    && chmod -R 777 var

# Expose port 80 for Apache
EXPOSE 80
