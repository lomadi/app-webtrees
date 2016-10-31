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

#### start the application

* http:/localhost:10080
* the webtrees database is preconfigured with 
  * user: __admin__
  * password: __changethepassword__
 * change the admin password, create users, etc.
   * https://wiki.webtrees.net/en/Administration_pages#Users
   * https://wiki.webtrees.net/en/Novice_User_Guide
   


