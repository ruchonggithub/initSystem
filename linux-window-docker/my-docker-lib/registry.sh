
###docker搭建私服
docker pull registry
# 参数注解：
# run：启动
# -d： 后台运行
# -p 5000:5000 宿主机5000端口映射到容器5000端口（registry仓库默认开启5000端口）
# --name myregistry 容器重命名
# --restart=always 重启设置
# -v 主机目录:docker目录 将docker目录挂载到主机目录，防止镜像消失
# registry[:tag] 需要启动到仓库名称（不添加tag，默认拉取最新版:latest）
docker stop localhostregistry
docker rm localhostregistry
docker run -d -p 5000:5000  --name localhostregistry  --restart=always  -v /opt/registry:/var/lib/registry  registry

if fgrep -q "deamon.json" $(ls /etc/docker) &&  fgrep -q "insecure-registries"  /etc/docker/daemon.json ;then
echo "'localhostregistry' already exists,skip registry..." ;else
echo "'localhostregistry' creating..."
cat >> /etc/docker/daemon.json << EOF
{
    "insecure-registries":["localhost:5000"]
}
EOF
echo "'localhostregistry' create success"
fi

#cat "127.0.0.1 localhost" >> /etc/hosts    #添加主机名映射


#重启docker容器
systemctl daemon-reload  #重载docker配置

systemctl restart docker    #重启docker服务

docker info #查看docker信息确认仓库是否添加
