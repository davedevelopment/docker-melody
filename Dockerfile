FROM php:latest
MAINTAINER Dave Marshall <dave@atst.io>

RUN apt-get update && apt-get install -y libzip-dev

RUN pecl install zip

RUN echo "extension=zip.so" > /usr/local/etc/php/conf.d/zip.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN curl http://get.sensiolabs.org/melody.phar -o /usr/local/bin/melody && chmod a+x /usr/local/bin/melody

VOLUME ["/tmp/melody"]

ENTRYPOINT ["/usr/local/bin/melody", "run"]
