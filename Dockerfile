FROM alpine:3.11.3
LABEL maintainer="emilio@ociotec.com"

RUN apk add --no-cache subversion apache2-webdav apache2-utils mod_dav_svn

EXPOSE 80

STOPSIGNAL SIGWINCH

VOLUME /etc/svn
VOLUME /var/lib/svn
WORKDIR /var/lib/svn

COPY apache2/* /etc/apache2/conf.d/
COPY svn/* /etc/svn/

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
