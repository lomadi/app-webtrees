docker ps -aq

docker rm  $(docker ps -aq)

docker build -t lomadi/webtrees .
docker build -t lomadi/webtrees  images/webtrees

docker run -it --rm --name webtrees  lomadi/webtrees

docker-compose up -d
docker-compose down

docker logs webtrees
docker exec -it webtrees /bin/bash


use webtrees;
show tables;

select * from wt_user ;