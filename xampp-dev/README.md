# xampp-dev

[xampp7.3下载地址](https://excellmedia.dl.sourceforge.net/project/xampp/XAMPP%20Linux/7.3.10/xampp-linux-x64-7.3.10-1-installer.run)

## docker常用命令

删除容器：`docker rm gentou`

创建容器：`docker run -p 8020:8000 -v $(pwd):/var/local/www  --name gentou cgk-xampp-dev:latest`

终端操作：`docker exec -i -t gentou -i -t`

重启服务：`docker exec gentou /opt/lampp/xampp restart`
