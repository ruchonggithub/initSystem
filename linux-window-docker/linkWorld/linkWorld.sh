#mkdir -p /etc/linkWorld
##宿主机创建配置文件，这里自己可以修改端口号，例如本文的36572
##一个 > 是覆盖内容，两个是追加内容
#cat > /etc/linkWorld/config.json  << EOF
#  "log" : {
#    "access": "/var/log/linkWorld/access.log",
#    "error": "/var/log/linkWorld/error.log",
#    "loglevel": "warning"
#  },
#  "inbounds": [{
#    "port": 8888,
#    "protocol": "vmess",
#    "settings": {
#      "clients": [
#        {
#          "id": "ccccc1ccc-8888-aaaa-ddd-c2223ae49153",
#          "level": 1,
#          "alterId": 64
#        }
#      ]
#    }
#  }],
#  "outbounds": [{
#    "protocol": "freedom",
#    "settings": {}
#  }]
#}
#EOF

#拉取官方镜像，并将镜像存储于/var/lib/docker/image/overlay2/imagedb/content/sha256目录下，如无法删除镜像直接删文件即可
docker pull v2fly/v2fly-core

#创建容器，指定名称v2ray
docker stop v2ray
docker rm v2ray
#-v /etc/linkWorld:/etc/linkWorld
docker run -itd -p 8888:8888  --name v2ray v2fly/v2fly-core sh