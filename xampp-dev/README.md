# xampp-dev

[xampp7.3下载地址](https://excellmedia.dl.sourceforge.net/project/xampp/XAMPP%20Linux/7.3.10/xampp-linux-x64-7.3.10-1-installer.run)

## 配置修改

### etc/httpd.conf 启动虚拟机 httpd-vhosts.conf

```ini
# Virtual hosts
Include etc/extra/httpd-vhosts.conf

```

### etc/extra/httpd-vhosts.conf 中配置服务

```ini
<Directory "/var/local/www">
    Options Indexes FollowSymLinks ExecCGI Includes
    AllowOverride All
    Require all granted
</Directory>

Listen 8000
<VirtualHost *:8000>
    ServerAdmin webmaster@local1
    DocumentRoot "/var/local/www"
    ServerName localhost
    ServerAlias local1
    ErrorLog "logs/local1-error_log"
    CustomLog "logs/local1-access_log" common
</VirtualHost>
```

### etc/extra/httpd-xampp.conf 中修改phpmyadmin 权限

```ini
<Directory "/opt/lampp/phpmyadmin">
    AllowOverride AuthConfig Limit
    # require local
    Require all granted
    ErrorDocument 403 /error/XAMPP_FORBIDDEN.html.var
</Directory>
```

### etc/my.cnf 中 加入 略表名大表写

```ini
[mysqld]
lower_case_table_names=1
```

## docker常用命令

```sh
# 删除容器
docker rm gentou

# 创建容器
docker run -p 8020:8000 -v $(pwd):/var/local/www  --name gentou cgk-xampp-dev:latest

docker run -idt  \
    -p 8020:8000 -p 8021:80 \
    -v $(pwd):/var/local/www \
    -v $(pwd)/db/logs:/opt/lampp/logs \
    --name gentou \
    cgk-xampp-dev:latest \
&& docker exec gentou /opt/lampp/xampp start

# 停止并删除
docker stop gentou && docker rm gentou

# 终端操作
docker exec -i -t gentou /bin/bash

docker attach gentou #退出时 先后按Ctrl-p和Ctrl-q键

# 重启服务
docker exec gentou /opt/lampp/xampp restart

# 保存镜像方法一
docker save --output cgk-xampp-dev-latest.tar cgk-xampp-dev:latest

# 保存镜像方法二
docker save cgk-xampp-dev:latest| gzip > cgk-xampp-dev-latest.tar.gz
```

## 导入数据库

```sh
#方法一：直接导入
docker exec -it  gentou  bash -c "/opt/lampp/bin/mysql  --database=test  < /var/local/www/db/gentou_20190411.sql"

#方法二：进入容器导入
/opt/lampp/bin/mysql  --database=test  < "/var/local/www/db/gentou_20190411.sql"

```

```sql
--生成清理数据语句
SELECT CONCAT('drop table ',table_name,';') FROM information_schema.`TABLES` WHERE table_schema='test';
```

## 安装私人仓库

```sh
docker run -d -v ~/Documents/Docker:/var/lib/registry -p 5000:5000 --restart=always --name registry registry
```

## 阿里云仓库

```sh
docker login --username=#######@aliyun.com registry.cn-hangzhou.aliyuncs.com
docker tag [ImageId] registry.cn-hangzhou.aliyuncs.com/jinguisoft/cgk-xampp-dev:[镜像版本号]
docker push registry.cn-hangzhou.aliyuncs.com/jinguisoft/cgk-xampp-dev:[镜像版本号]

docker pull registry.cn-hangzhou.aliyuncs.com/jinguisoft/cgk-xampp-dev:[镜像版本号]
```

## 安装portainer/portainer

[文档](https://portainer.readthedocs.io/en/stable/deployment.html#quick-start)

```sh
mkdir -p ~/dev/docker_file/portainer/data
docker run -d -p 9000:9000 --restart=always --name portainer -v /var/run/docker.sock:/var/run/docker.sock -v ~/dev/docker_file/portainer/data:/data docker.io/portainer/portainer
```
