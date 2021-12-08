#!/usr/bin/env python3
# -*- coding:utf-8 -*-
import os
import shutil
import stat


# 遍历目录
import sys

if __name__ == "__main__":
    print("正在配置nginx")
    dir = os.path.dirname(sys.argv[0])
    repo =dir + "/nginx.repo"
    print(repo)
    shutil.copy(repo, "/etc/yum.repos.d/nginx.repo")
    os.system("yum install -y nginx") # 安装
    os.system("yum -v") # 检查版本
    conf = dir + "/../nginx.conf"
    print("配置文件地址：",conf)
    shutil.copy(conf, "/etc/nginx/nginx.conf")
    # shutil.copy(conf, "/etc/nginx/conf.d/default.conf")
    print("systemctl start nginx")
    os.system("systemctl start nginx")
    print("systemctl enable nginx")
    os.system("systemctl enable nginx")
