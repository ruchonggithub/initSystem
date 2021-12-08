#!/usr/bin/env python3
# -*- coding:utf-8 -*-

# 遍历目录
import os

def install(name):
    print()
    print(" = 正在安装 "+name+" 工具 >")
    os.system("yum install -y "+name)
    print(" = "+name+" 安装完成 <")
    print()

if __name__ == "__main__":
    print("正在安装一些常用工具")
    # install("telnet.x86_64")


