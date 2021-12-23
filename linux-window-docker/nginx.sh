#
#
# #不知道为什么  部署了docker上的nginx之后linux本机上的nginx就无法发挥作用
#
#1
# ###部署 nginx
# rm -rf /home/nginx/
# mkdir -p /home/nginx/{conf,conf.d,html,log}
#
#
# docker pull nginx
# docker stop nginx
# docker rm nginx
## -v /home/nginx/conf/nginx.conf:/etc/nginx/nginx.conf
# docker run -d --name nginx -p 16080:80   -v /home/nginx/conf/:/etc/nginx/ -v /home/nginx/log:/var/log/nginx -v /home/nginx/html:/usr/share/nginx/html nginx
#
# ##crictl pull nginx
# ##crictl stop nginx
# ##crictl rm nginx
# ##crictl run -d --name nginx -p 16080:80  -v /home/nginx/conf/nginx.conf:/etc/nginx/nginx.conf  -v /home/nginx/log:/var/log/nginx -v /home/nginx/html:/usr/share/nginx/html nginx
#
#
#
# cp ./nginx.conf  /home/nginx/conf/nginx.conf
# docker exec -it nginx bash
# nginx -t
# nginx -s reload
# exit
#
