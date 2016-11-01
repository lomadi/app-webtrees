# WEBTREES application
webtrees dockerized by lomadi
## Hints
* approx. time with medium fast internet connection: **5 minutes**
  * download from https://github.com/lomadi/app-webtrees 
  * run **./install.sh -f /yourpath/without/slash/at/the/end  -p 10080"**
    * -f specifie the path to your data folder 
    * -p port for webtree container
  * _$ docker-compose up -d_ 
  * open http://localhost:10080 in your browser (change the port, as specified in install.sh)
  * initial user/password: **admin** / **changethepassword**

## Docker Images Used
 * [lomadi/webtrees] 
 * [mySQL](https://hub.docker.com/_/mysql/), offical mySQL container
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

#### docker-compose.yml
change the port 10080 to some free port and inlcude it in your proxy server
```
webtrees:
    image:  lomadi/webtrees:latest
    container_name:  webtrees
    links:
      - webtrees-database:webtrees-database
    ports:
      - "10080:80"
    depends_on:
      - webtrees-database
      - webtrees-data-volumes
    volumes_from: 
      - webtrees-data-volumes
```
change the path to mount the mysql database and the webtrees data directory to you local filesystem
```
  webtrees-data-volumes:
    image: busybox
    container_name: webtrees-data-volumes
    volumes:
      - /Users/mue/dockerdata/webtrees/var/lib/mysql:/var/lib/mysql
      - /Users/mue/dockerdata/webtrees/var/www/html/webtrees/data:/var/www/html/webtrees/data
```
#### startup the docker conatainers 
```
$ docker-compose up -d
```
if everything went OK, you shoud see two container running with the command
```
$ docker ps 
```
When docker-compose ist startet the first time, the webtrees database is initialized with default values (stored in _database-dump/dump.sql_ and the default config file is copied to the webtrees data directory (stored in _images/webtrees/config/config.ini.php_)

#### start the application

* http:/localhost:10080
* login with 
  * user: __admin__
  * password: __changethepassword__
 * change the admin password, create users, etc.
   * https://wiki.webtrees.net/en/Administration_pages#Users
   * https://wiki.webtrees.net/en/Novice_User_Guide
   
