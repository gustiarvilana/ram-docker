FROM dunglas/frankenphp

# Install dependencies & PHP extensions dalam satu RUN untuk mengurangi layer
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    libzip-dev \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libonig-dev \
    libicu-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip intl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app

# Copy seluruh project Laravel ke dalam container
COPY . .

# Install dependencies Laravel (termasuk predis untuk Redis support)
RUN composer install --optimize-autoloader --no-dev && \
    composer require predis/predis

# Set permission untuk storage dan bootstrap/cache agar Laravel bisa berjalan
RUN chmod -R 777 storage bootstrap/cache

# Default command untuk menjalankan Octane dengan FrankenPHP
# CMD ["php", "artisan", "octane:start", "--server=frankenphp"]

ENTRYPOINT ["php", "artisan", "octane:frankenphp"]
