FROM	alpine:latest

RUN apk add --no-cache \
      rsyslog \
      rsyslog-hiredis \
      rsyslog-snmp \
      rsyslog-mysql \
      rsyslog-pgsql \
      rsyslog-tls \
      git build-base automake libtool autoconf py-docutils gnutls gnutls-dev \
      zlib-dev curl-dev mysql-dev libdbi-dev libuuid util-linux-dev \
      libgcrypt-dev flex bison bsd-compat-headers linux-headers valgrind librdkafka-dev \
      autoconf-archive \
      libestr-dev \
      libfastjson-dev \
      liblognorm-dev \
      librelp-dev \
      liblogging-dev \
      && \
    :
COPY . /
VOLUME /var/run/rsyslog/dev
ENTRYPOINT ["rsyslogd", "-n", "-f", "/etc/rsyslogd.conf"]

EXPOSE 514/tcp
EXPOSE 514/udp
