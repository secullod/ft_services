#!/bin/sh

# Start Telegraf and phpMyAdmin.
# php --help (-S, --server; Start the internal web server / -t, --docroot; Specify the root of the document for the internal web server).
# telegraf & php -S 0.0.0.0:5000 -t /www/phpmyadmin
#!/bin/ash
echo "FT_SERVICES - phpMyAdmin CONTAINTER"
nginx -t
nginx
php-fpm7
telegraf &
tail -f /dev/null