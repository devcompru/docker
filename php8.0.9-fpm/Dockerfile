FROM php:8.0.9-fpm
RUN pecl install xhprof \
&& apt-get update \
&& PHP_EXTENSION_INSTALLER_VERSION=$(curl -s https://api.github.com/repos/mlocati/docker-php-extension-installer/releases/latest | grep 'tag_name' | cut -d '"' -f4) ; \
   	echo "install-php-extensions Version: ${PHP_EXTENSION_INSTALLER_VERSION}" ; \
   	curl -sSL https://github.com/mlocati/docker-php-extension-installer/releases/download/${PHP_EXTENSION_INSTALLER_VERSION}/install-php-extensions -o /usr/local/bin/install-php-extensions ; \
   	chmod +x /usr/local/bin/install-php-extensions \
&& apt-get install -y \
graphviz          \
libzip-dev        \
libpng-dev        \
libjpeg-dev       \
libwebp-dev       \
libfreetype6-dev  \
libmemcached11    \
libmemcachedutil2 \
build-essential   \
libmemcached-dev  \
libicu-dev        \
&& install-php-extensions imap \
    && docker-php-ext-configure gd \
    --with-webp=/usr/include/ \
    --with-freetype=/usr/include/ \
    --with-jpeg=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip \
    && docker-php-ext-install gd \
    && docker-php-ext-install sockets \
    && docker-php-ext-install opcache \
    && docker-php-ext-enable opcache \
    && docker-php-ext-install pdo_mysql \
    && pecl install memcached \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && echo extension=memcached.so >> /usr/local/etc/php/conf.d/memcached.ini \
    && docker-php-source delete \
    && mkdir /usr/app \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/app
ADD php.ini /usr/local/etc/php/conf.d/40-custom.ini

CMD ["php-fpm"]