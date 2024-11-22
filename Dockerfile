FROM wordpress:5.1.1-fpm-alpine
RUN apk add --no-cache redis
