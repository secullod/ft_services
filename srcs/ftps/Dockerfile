FROM	alpine

RUN		apk update && apk add vsftpd openssl
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN		echo "root:toor" | chpasswd
RUN		openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 -subj '/C=US/ST=CA/L=LA/O=42/CN=secullod' \
		-keyout /etc/ssl/private/vsftpd.key \
		-out /etc/ssl/certs/vsftpd.crt

COPY	/srcs/telegraf.conf			/etc/telegraf/
COPY	/srcs/vsftpd.conf			/etc/vsftpd
COPY	/srcs/start.sh				/

EXPOSE	21 20 30000

ENTRYPOINT	sh start.sh
