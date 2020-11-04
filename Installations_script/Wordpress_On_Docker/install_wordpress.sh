docker network create --driver bridge wpnet
docker volume create wordpress-vol
docker volume create mysql-vol

docker run \
-d \
--name database \
--restart always \
--network wpnet \
-v mysql-vol:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=mysqlroot123 \
-e MYSQL_DATABASE=wordpress \
-e MYSQL_USER=wpuser \
-e MYSQL_PASSWORD=wpuser123 \
mysql:5.6
        
        
docker run \
-d \
--name wordpress \
--restart always \
--network wpnet \
-p 80:80 \
-v wordpress-vol:/var/www/html/ \
-e WORDPRESS_DB_HOST=database \
-e WORDPRESS_DB_USER=wpuser \
-e WORDPRESS_DB_PASSWORD=wpuser123 \
-e WORDPRESS_DB_NAME=wordpress \
wordpress:latestdocker volume create myvol
docker volume ls
docker volume rm myvol
docker volume inspect myvol
docker network create --driver bridge wpnet
docker volume create wordpress-vol
docker volume create mysql-vol

docker run \
-d \
--name database \
--restart always \
--network wpnet \
-v mysql-vol:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=mysqlroot123 \
-e MYSQL_DATABASE=wordpress \
-e MYSQL_USER=wpuser \
-e MYSQL_PASSWORD=wpuser123 \
mysql:5.6
        
        
docker run \
-d \
--name wordpress \
--restart always \
--network wpnet \
-p 80:80 \
-v wordpress-vol:/var/www/html/ \
-e WORDPRESS_DB_HOST=database \
-e WORDPRESS_DB_USER=wpuser \
-e WORDPRESS_DB_PASSWORD=wpuser123 \
-e WORDPRESS_DB_NAME=wordpress \
wordpress:latest
