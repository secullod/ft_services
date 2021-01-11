FROM 	alpine

RUN		apk update && apk add openrc --no-cache
RUN		apk add influxdb
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN		openrc && touch /run/openrc/softlevel
RUN		rc-update add telegraf

COPY	/srcs/telegraf.conf			/etc/
COPY	/srcs/start.sh				/

EXPOSE	8086

ENTRYPOINT sh start.sh
