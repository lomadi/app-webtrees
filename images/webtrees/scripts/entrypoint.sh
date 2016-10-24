#!/bin/bash
echo "Starting Webtrees Application Container!"

mkdir -p /data/home
chown -R www-data:www-data /data /app/webtrees && \
if [ -d /data/ssh ]; then
	cp /data/ssh/ssh_host* /etc/ssh
	chmod 0600 /etc/ssh/ssh_host*
	chmod 0644 etc/ssh/ssh_host*.pub
fi
/etc/init.d/php5-fpm start
/etc/init.d/nginx start
/etc/init.d/ssh start
exec tail -f /var/log/nginx/access.log # wait
