FROM php:7-apache
ENV MIBEW_VERSION 3.1.3
ENV MIBEW_VERSION_DATE 20180525
WORKDIR /tmp
RUN apt-get update && \
    apt-get install -y libpng-dev
RUN docker-php-ext-install pdo pdo_mysql mbstring zip gd
RUN rm -r /var/www/html && \
    curl -SL https://sourceforge.net/projects/mibew/files/core/$MIBEW_VERSION/mibew-$MIBEW_VERSION.tar.gz/download > /tmp/download.tar.gz && \
    curl -SL https://sourceforge.net/projects/mibew/files/i18n/de/$MIBEW_VERSION/mibew-i18n-de-$MIBEW_VERSION-$MIBEW_VERSION_DATE.tar.gz/download > /tmp/download-locale.tar.gz &&\
    tar -zxf /tmp/download-locale.tar.gz && \
    tar -zxf /tmp/download.tar.gz && \
    mv mibew /var/www/ && \
    mv /var/www/mibew /var/www/html && \
    mv de /var/www/html/locales/ && \
    chmod -R 0755 /var/www/html && \
    chown -R www-data:www-data /var/www/html
COPY config.yml /var/www/html/configs/
EXPOSE 80
