FROM php:7.0-apache

ENV WWW_ROOT /var/www/html

# Install required dep
RUN set -xe && \
        apt-get update && apt-get install --no-install-recommends --no-install-suggests -y \
            zlib1g-dev \
            libmysqlclient-dev \
        && docker-php-ext-install \
            zip \
            pdo_mysql \
        && rm -r /var/lib/apt/lists/*

# Install Composer
RUN set -xe && \
        curl -o composer-setup.php https://getcomposer.org/installer \
        && curl -o composer-setup.sig https://composer.github.io/installer.sig \
        && php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) !== trim(file_get_contents('composer-setup.sig'))) { unlink('composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
        && php composer-setup.php \
        && php -r "unlink('composer-setup.php');" \
        &&  mv composer.phar /usr/local/bin/composer

# Apache2 setting
RUN set -xe && \
        a2enmod rewrite && \
        sed -i "s/DocumentRoot.*/DocumentRoot \/var\/www\/html\/public/g" /etc/apache2/sites-enabled/000-default.conf


WORKDIR ${WWW_ROOT}

# Install application
COPY ./blog/composer.json .
COPY ./blog/composer.lock .
COPY ./blog/.env.example .
RUN composer install --no-dev --optimize-autoloader

# Copy production
COPY ./blog .
