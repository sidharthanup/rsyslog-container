# container for rsyslog development
# creates the build environment
FROM	alpine:latest
LABEL   maintainer="rgerhards@adiscon.com"
COPY	rsyslog@lists.adiscon.com-5a55e598.rsa.pub /etc/apk/keys/rsyslog@lists.adiscon.com-5a55e598.rsa.pub
RUN	echo "http://alpine.rsyslog.com/3.7/stable" >> /etc/apk/repositories \
	&& apk --no-cache update
RUN	apk add --no-cache \
		git build-base automake libtool autoconf py-docutils gnutls gnutls-dev \
		zlib-dev curl-dev mysql-dev libdbi-dev libuuid util-linux-dev \
		libgcrypt-dev flex bison bsd-compat-headers linux-headers valgrind librdkafka-dev \
		autoconf-archive \
		libestr-dev \
		libfastjson-dev \
		liblognorm-dev \
		librelp-dev \
                liblogging-dev
COPY . /
VOLUME /var/run/rsyslog/dev
ENTRYPOINT ["rsyslogd", "-n", "-f", "/etc/rsyslogd.conf"]

EXPOSE 514/tcp
EXPOSE 514/udp
