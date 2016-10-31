docker ps -aq
docker rm  $(docker ps -aq)

docker build -t lomadi/webtrees .
docker build -t lomadi/webtrees  images/webtrees

docker run -it --rm --name webtrees  lomadi/webtrees

docker-compose up -d
docker-compose down

docker logs webtrees
docker exec -it webtrees /bin/bash


# DB 
docker exec -it webtrees-database /bin/bash
mysqldump --all-databases > dump.sql
mysql -u webtrees -p  

use webtrees;
show tables;
select * from wt_user ;

