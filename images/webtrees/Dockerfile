# See https://github.com/mar10/webtrees

# We borrow the base from here: https://github.com/tutumcloud/lamp/blob/master/Dockerfile
FROM tutum/lamp:latest
MAINTAINER mar10 <mar10@wwwwendt.de>

# The base container added a symlink: 'ln -s /app /var/www/html'
# so we can unzip webtrees to /app
RUN apt-get update
RUN apt-get -y install wget
RUN apt-get -y install unzip

# Webtrees wants the PHP 'gd' plugin for image thumbnails
RUN apt-get -y install php5-gd

# Replace hello world app from base container with webtrees
RUN rm -fr /app
RUN mkdir /app
RUN cd /app
# (`cd` doesn't seem to work, so we use WORKDIR)
WORKDIR /app

# Install Webtrees as to /app/webtrees
RUN wget https://launchpad.net/webtrees/1.7/1.7.2/+download/webtrees-1.7.2.zip
RUN unzip webtrees-*.zip

EXPOSE 80 3306
CMD ["/run.sh"]
