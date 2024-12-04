FROM wordpress:6.7-fpm-alpine

RUN apk add --no-cache unzip curl

RUN curl -L https://downloads.wordpress.org/plugin/redis-cache.latest-stable.zip -o /tmp/redis-cache.zip \
    && [ -s /tmp/redis-cache.zip ] \
    && unzip /tmp/redis-cache.zip -d /usr/src/wordpress/wp-content/plugins/ \
    && rm /tmp/redis-cache.zip

RUN sed -i "1a define('WP_REDIS_HOST', 'redis');" /usr/src/wordpress/wp-config-sample.php \
    && sed -i "2a define('WP_REDIS_PORT', 6379);" /usr/src/wordpress/wp-config-sample.php \
    && sed -i "3a define('WP_CACHE', true);" /usr/src/wordpress/wp-config-sample.php

RUN chown -R www-data:www-data /usr/src/wordpress/wp-content/plugins/redis-cache
