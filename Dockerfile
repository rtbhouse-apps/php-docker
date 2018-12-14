FROM ubuntu:18.04
EXPOSE 80

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx supervisor wget vim-nox mc php7.2-fpm php7.2-pgsql php7.2-apcu

ADD nginx.conf /etc/nginx/sites-available/php-fastcgi
RUN ln -s ../sites-available/php-fastcgi /etc/nginx/sites-enabled
RUN rm /etc/nginx/sites-enabled/default

ADD php-custom.ini /etc/php/7.2/php-custom.ini
RUN ln -s ../../php-custom.ini /etc/php/7.2/fpm/conf.d

RUN mkdir -p /var/run/php
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
