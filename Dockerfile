FROM ubuntu:16.04
MAINTAINER Arvind Rawat <arvindr226@gmail.com>

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl apache2 php7.0 php7.0-zip php7.0-curl libapache2-mod-php7.0 composer git && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
RUN a2enmod rewrite
#RUN sed -i 's/DocumentRoot \/var\/www\/html/ DocumentRoot \/var\/www\/html\/htdocs/' /etc/apache2/sites-available/000-default.conf
RUN rm /var/www/html/index.html
RUN rmdir /var/www/html
WORKDIR /var/www/

RUN git clone https://github.com/Ira-Monko/OnboardRocks.git html

WORKDIR /var/www/html/
RUN composer install
RUN chown -R www-data:www-data /var/www/html
#VOLUME [ "/var/www/html" ]
COPY .htaccess /var/www/html/.htaccess
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

RUN mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR

EXPOSE 80

ENTRYPOINT [ "/usr/sbin/apache2" ]
CMD ["-D", "FOREGROUND"]
