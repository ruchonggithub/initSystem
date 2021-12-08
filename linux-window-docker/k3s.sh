
########在线安装
#http://docs.rancher.cn/docs/k3s/installation/install-options/_index
###安装k3s
#curl -sfL https://get.k3s.io | sh -   #官网脚本安装
curl -sfL http://rancher-mirror.cnrancher.com/k3s/k3s-install.sh | INSTALL_K3S_MIRROR=cn sh -  #国内镜像加速脚本安装
k3s kubectl get node


# #设置containerd容器管理器的镜像加速源(方法一)
# cp /var/lib/rancher/k3s/agent/etc/containerd/config.toml /var/lib/rancher/k3s/agent/etc/containerd/config.toml.tmpl
# cat >> /var/lib/rancher/k3s/agent/etc/containerd/config.toml.tmpl << EOF
# [plugins.cri.registry.mirrors]
#   [plugins.cri.registry.mirrors."docker.io"]
#     endpoint = ["https://mirror.ccs.tencentyun.com"] #镜像加速地址
#   [plugins.cri.registry.mirrors."localhost"]
#     endpoint = ["http://127.0.0.1:5000"] #私有仓库
# [plugins.cri.registry.configs."localhost".auth] #没有的话可以省略
#   username = "k3s"
#   password = "REG@k3s"
# [plugins.cri.registry.configs."baidu.com".tls]
#   ca_file = "/opt/certs/ca.crt"
##   cert_file = "/opt/certs/baidu.com.cert"
##   key_file = "/opt/certs/baidu.com.key"
# EOF

#设置containerd容器管理器的镜像加速源(方法二)
cat >> /etc/rancher/k3s/registries.yaml << EOF
mirrors:
  "docker.io":
    endpoint:
      - "https://mirror.ccs.tencentyun.com"
    #   - "https://mirror.ccs.tencentyun.com" #有多个的写法
  "localhost":
    endpoint:
      - "http://localhost:5000"
#configs: #没有的话可以省略
#  "localhost":
#    auth:
#      username: k3s # this is the registry username
#      password: REG@k3s # this is the registry password

#     tls: #证书（与auth同一级）
#       ca_file: /opt/certs/ca.crt # path to the ca file used in the registry
##       #如果有双向认证的话会用到下面两项（与ca_file同一级）
##       cert_file: /opt/certs/baidu.com.cert # path to the cert file used in the registry
##       key_file: /opt/certs/baidu.com.key # path to the key file used in the registry
EOF

#重启k3s
systemctl restart k3s

