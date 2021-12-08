#!/usr/bin/env python3
# -*- coding:utf-8 -*-
import stat
import sys
import re
import os

# runableRule = [r"\.py$",r"\.sh$"]
runableRule = [
    {
        "rule": r"\.py$",
        "cmd": {
            "win": "python ",
            "linux": ""
        }
    },
    {
        "rule": r"\.sh$",
        "cmd": {
            "win": "",
            "linux": ""
        }
    },
]
sysType = "aa"


# 检查系统类型
def checkSystemType():
    sysType = "linux"
    print("system type : ", sys.platform)
    if (sys.platform.find("win") >= 0):
        sysType = "win"
    return sysType


# 遍历文件
def eachDir(rootdir, do):
    list = os.listdir(rootdir)  # 列出文件夹下所有的目录与文件
    for i in range(0, len(list)):
        path = os.path.join(rootdir, list[i])
        ispath = os.path.isdir(path)
        # print(list[i],"===>",ispath)
        if (ispath):
            eachDir(path, do)
        else:
            do(path)


def fileDo(path):
    fileInfo = dict(zip(["path", "name", "suff"], [path, os.path.basename(path), os.path.splitext(path)[1]]))
    for i in range(0, len(runableRule)):
        cmdRule = runableRule[i]
        if (re.search(cmdRule["rule"], path)):
            print()
            print("检测到可执行脚本==>", path)
            print()
            # 忽略正在执行的自身，避免死循环
            if (rootdir + os.path.basename(sys.argv[0]) == path):
                print("跳过 main 脚本 . ")
                print()
                continue

            if (path.find(sysType) > 0):
                # os.chmod 修改权限
                # os.stat(f).st_mode 文件的权限
                # stat.S_IXUSR  对于拥有者执行的权限
                os.chmod(path, os.stat(path).st_mode | stat.S_IXUSR)
                aa = os.system(cmdRule["cmd"][sysType] + path)
                # print(aa)
            else:
                print("脚本与系统平台不匹配，已跳过执行")
                print()

def checkPort(num):
    print(str(num)+" 端口：")
    print("netstat -ntlp |grep " + str(num))
    os.system("netstat -ntlp |grep "+str(num))
    print()

# 遍历目录
if __name__ == "__main__":
    rootdir = "./"
    sysType = checkSystemType()
    print()
    print("========== 开始遍历执行脚本 ==========")
    print()
    eachDir(rootdir=rootdir, do=fileDo)
    print()
    print("检查 端口使用情况 ")
    print()
    checkPort(80)
    print()
    print("========== 全部脚本执行完毕 ==========")

    # print("检查 端口使用情况 ")
