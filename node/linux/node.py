import os


def run(cmd):
    print(cmd)
    os.system(cmd)
    print()

if __name__ == '__main__':
    print("正在安装 nodejs")
    run("curl -sL https://deb.nodesource.com/setup_16.x | sudo bash")
    run("yum install -y gcc-c++ make")
    run("yum -y install nodejs")