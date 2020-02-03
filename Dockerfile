FROM ubuntu:18.04
LABEL maintainer="emilio@ociotec.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends subversion apache2 apache2-utils libapache2-mod-svn && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 80

VOLUME /etc/svn
VOLUME /var/lib/svn
WORKDIR /var/lib/svn

COPY apache2/custom.conf /etc/apache2/conf-available/
RUN a2enconf custom.conf
COPY apache2/svn.conf /etc/apache2/conf-available/
RUN a2enconf svn.conf

COPY svn/authz /etc/svn/
COPY svn/passwd /etc/svn/

COPY docker-entrypoint.sh /usr/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["apachectl", "-D", "FOREGROUND"]
