#!/bin/bash
echo "Starting Webtrees Application Container!"

/etc/init.d/apache2 start
tail -f /var/log/apache2/error.log # wait
