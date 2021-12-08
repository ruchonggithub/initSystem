# 环境初始化脚本

#### 介绍
环境初始化脚本

#### 软件架构
1. 程序入口在main.py中
2. 程序自动判断当前系统是 windows还是linux
3. 在 windows 系统中自动执行路径中含有 "win" 关键词的脚本
   在 linux 系统中自动执行路径中含有 "linux " 关键词的脚本 

软件架构说明
- initSystem 总文件夹
    - 脚本包1
        - 对应系统的脚本
            - xxx.py
            - xxx.sh
        - windows
            - windows能运行的脚本.py
        - linux-windows
            - linux和windows都能运行的脚本.py
    - node
        - linux
            - node.py
        - windows
            - xxx.py
        - linux-windows
            - linux和windows都能运行的脚本.py
    - linux-window-docker
        - k3s.py
        - mysql.py
        - nginx.conf
        - nginx.py
        - registry.py
     


#### 安装教程

1.  复制所有文件到需要初始化环境的系统
2.  运行 main.py


#### 使用说明

1.  复制所有文件到需要初始化环境的系统
2.  运行 main.py

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request



