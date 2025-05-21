FROM php:8.1-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    unzip \
    git \
    curl \
    zip \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libxml2-dev \
    libonig-dev \
    && docker-php-ext-install zip gd dom mbstring

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# Enable mod_rewrite
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html/

# Copy project files
COPY . .

# Debug: Show files before Composer
RUN echo "📁 Directory contents:" && ls -la

# Run Composer install (fail gracefully with message)
RUN composer install --no-interaction --no-progress || { echo "❌ Composer failed"; cat composer.json; exit 1; }

EXPOSE 80
