FROM	alpine

RUN 	mkdir -p /run/nginx

RUN		apk add nginx php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session phpmyadmin
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN		chown nginx:nginx -R 	/etc/phpmyadmin/
RUN    	chown nginx:nginx -R 	/usr/share/webapps/phpmyadmin

COPY	/srcs/telegraf.conf		/etc/telegraf/
COPY	/srcs/config.inc.php	/etc/phpmyadmin/
COPY	/srcs/start.sh			/
COPY    /srcs/nginx.conf 		/etc/nginx/conf.d/default.conf

EXPOSE	5000

ENTRYPOINT sh start.sh