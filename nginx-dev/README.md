# nginx-dev

## 安装

```sh
#安装基础包
yum install gcc gcc-c++ kernel-devel
yum -y install wget
yum -y install net-tools

#安装PCRE库 Perl Compatible Regular Expressions
#http://www.pcre.org/

yum -y install pcre pcre-devel
#pcre-config --version

#安装zlib
yum -y zlib zlib-devel

#安装openssl 
yum -y install openssl openssl-devel

#安装redis
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum list

yum install redis

redis-server --daemonize yes

#安装nginx
wget https://nginx.org/download/nginx-1.17.9.tar.gz
tar -zxvf nginx-1.17.9.tar.gz
cd nginx-1.17.9
./configure --prefix=/usr/local/nginx
make & make install

#可以直接安装 openresty 的nginx版 ：https://openresty.org/en/
yum-config-manager --add-repo https://openresty.org/package/centos/openresty.repo
yum install openresty
yum install openresty-resty
# 安装路径：/usr/local/openresty

#安装 mariadb
# https://mariadb.com/kb/en/mariadb-package-repository-setup-and-usage/

curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash
yum install MariaDB-server MariaDB-client

#启动
https://mariadb.com/kb/en/starting-and-stopping-mariadb-automatically/
mysqld --user=root &
mysqld_safe --defaults-file=/etc/my.cnf --user=root –skip-grant-tables &

mysqld_safe –user=mysql  –skip-networking &

#关闭
mysqladmin -u root -p shutdown

#状态
mysqladmin -u root -p status
ps aux|grep mysql

```

## docker常用命令

```sh
#复制文件
docker cp nginx:/usr/local/nginx/conf/. ./nginx/conf

# 删除容器
docker rm gentou

# 创建容器
docker run -p 8080:80 -v $(pwd):/var/local/www  --name jingui-main nginx-dev:latest

docker run -idt  \
    -p 8080:80 \
    -v $(pwd):/var/local/www \
    -v $(pwd)/nginx/conf:/usr/local/nginx/conf \
    -v $(pwd)/nginx/logs:/usr/local/nginx/logs \
    --name nginx \
    nginx-dev:latest \
&& docker exec nginx /usr/local/nginx/sbin/nginx \
&& docker exec nginx /usr/sbin/php-fpm -D \
&& docker exec nginx /usr/bin/redis-server --daemonize yes

# 停止并删除curl -s http://getcomposer.org/installer | php
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
