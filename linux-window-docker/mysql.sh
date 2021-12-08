

###部署 mysql
mkdir -p /home/mysql/{conf,data}
touch /home/mysql/conf/my.cnf

docker pull mysql
docker stop mysql
docker rm mysql
docker run -d --name mysql -p 3306:3306  -v /home/mysql/conf:/etc/mysql/conf.d -v /home/mysql/data:/var/lib/mysql  -e MYSQL_ROOT_PASSWORD=root  mysql

#crictl pull mysql
#crictl stop mysql
#crictl rm mysql
#crictl run -d --name mysql -p 3306:3306  -v /home/mysql/conf:/etc/mysql/conf.d -v /home/mysql/data:/var/lib/mysql  -e MYSQL_ROOT_PASSWORD=root  mysql
