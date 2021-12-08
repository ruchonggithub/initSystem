###部署 nginx
mkdir -p /home/nginx/{conf,conf.d,html,log}
cp ./nginx.conf  /home/nginx/conf/nginx.conf

docker pull nginx
docker stop nginx
docker rm nginx
docker run -d --name nginx -p 16080:80  -v /home/nginx/conf/nginx.conf:/etc/nginx/nginx.conf  -v /home/nginx/log:/var/log/nginx -v /home/nginx/html:/usr/share/nginx/html nginx

##crictl pull nginx
##crictl stop nginx
##crictl rm nginx
##crictl run -d --name nginx -p 16080:80  -v /home/nginx/conf/nginx.conf:/etc/nginx/nginx.conf  -v /home/nginx/log:/var/log/nginx -v /home/nginx/html:/usr/share/nginx/html nginx
