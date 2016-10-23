# See https://github.com/lomadi/app-webtrees/tree/master/images/webtrees


FROM nginx
MAINTAINER lomadi <lomadi@mac.com>

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
