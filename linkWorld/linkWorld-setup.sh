#!/bin/bash
sudo su
docker pull debian
docker stop debian
docker rm debian
cd ~/debian
wget https://gitee.com/ruchong/initSystem/raw/master/linkWorld/linkWorld-setup.sh
docker run -itd -p 65:65 -v ~/debian:/usr/root  --name debian debian sh


echo "1
3
65



" | bash <(curl -s -L https://git.io/v2ray.sh)
v2ray url