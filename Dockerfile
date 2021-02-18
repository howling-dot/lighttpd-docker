# Dockerfile for lighttpd

FROM alpine


RUN apk add --update --no-cache \
	lighttpd \
	lighttpd-mod_auth \
	php7 \
    php7-iconv \
    php7-session \
    php7-json \
    php7-curl \
    php7-xml \
    php7-imap \
    php7-cgi \
    php7-fpm \
    php7-pdo \
    php7-pdo_mysql \
    php7-soap \
    php7-xmlrpc \
    php7-posix \
    php7-mcrypt \
    php7-gettext \
    php7-ldap \
    php7-ctype \
    php7-dom \
    php7-phar \
    php7-openssl \
    php7-mbstring \
    fcgi \
  && rm -rf /var/cache/apk/*

COPY etc/lighttpd/* /etc/lighttpd/
COPY start.sh /usr/local/bin/

EXPOSE 80

VOLUME /var/www/localhost
VOLUME /etc/lighttpd

CMD ["start.sh"]
