# WEBTREES application
webtrees dockerized by lomadi

## Hints
* approx. time with medium fast internet connection: **5 minutes**
* initial user/passwordd: set at installation


## Docker Images Used
 * [lomadi/webtrees]
 * [mySQL](https://hub.docker.com/_/mysql/), offical mySQL container
 * [busybox](https://hub.docker.com/_/busybox/), offical data container
 
## Install Environment Variables
  *	MYSQL_ROOT_PASSWORD = password, only used within the docker container
  * MYSQL_DATABASE = name of the mysql database, typical *wordpress*. The DB file is stored in the mounted volume
  * MYSQL_USER = name of the mysql user, typical *wordpress*
  * MYSQL_PASSWORD = mysql user password, only used within the docker container

## Mounted Volumes

* the mysql datafolder _/var/mysql_ will be mounted to _/opt/apps/webtrees/var/mysql_ 
* change this in the docker_compose or generate the directory  _/opt/apps/webtrees_ at your server


## Installation Instructions 

