# WEBTREES application
dockerized https://github.com/fisharebest/webtrees 
## Hints
* approx. time with medium fast internet connection: **5 minutes**

* download from https://github.com/lomadi/app-webtrees
  * e.g. wget https://github.com/lomadi/app-webtrees/archive/master.zip; unzip master.zip; rm master.zip
  * cd app-webtrees-master
* run **sudo ./install.sh -f  /yourpath/without/slash/at/the/end  -p  portnumber"**
  * -f path to your data folder 
  * -p port for the webtrees container
* run **docker-compose  up  -d** 
* open http://localhost:10080/webtrees/ in your browser (change the port, as specified in install.sh)
* initial user/password: **admin** / **changethepassword**

## Docker Images Used
 * [lomadi/webtrees](https://hub.docker.com/r/lomadi/webtrees/) webtrees container 
 * [mySQL](https://hub.docker.com/_/mysql/), offical mySQL container, use version 5.2.6 for webtrees
 * [busybox](https://hub.docker.com/_/busybox/), offical data container
 
## Install Environment Variables
  *	MYSQL_ROOT_PASSWORD = password, only used within the docker container
  * MYSQL_DATABASE = name of the mysql database, typical *webtrees*. The DB file is stored in the mounted volume
  * MYSQL_USER = name of the mysql user, typical *webtrees*
  * MYSQL_PASSWORD = mysql user password, only used within the docker container

## Mounted Volumes

* the mysql datafolder _/var/mysql_ will be mounted to _/yourlocalpath/webtrees/var/mysql_ 
* the webtrees datafolder _/var/www/html/webtrees/data_ will be mounted to _/yourlocalpath/webtrees/var/www/html/webtrees/data_ 


## Installation Instructions 

#### run install.sh 

```
$sudo ./install.sh -f  /yourpath/without/slash/at/the/end  -p  portnumber
```

install.sh generates a local volume on your machine and copies the initial config for webtrees to ...var/www/html/webtrees/data. 

In the second step the script will generate out of docker-compose-template.yml the docker-compose.yml.

The mysql container is initialzed with a default user for the webtrees appilcation. 

#### startup the docker containers 
```
$ docker-compose up -d
$ docker ps 
```
When docker-compose ist startet the first time, the webtrees database is initialized with default values (stored in _database-dump/dump.sql_.


#### start the application

* http://localhost:portnumber/webtrees/ (change the port as configured in install.sh)
* login with 
  * user: __admin__
  * password: __changethepassword__
 * change the admin password, create users, etc.
   * https://wiki.webtrees.net/en/Administration_pages#Users
   * https://wiki.webtrees.net/en/Novice_User_Guide
   
