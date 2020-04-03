#!/bin/bash
#docker 容器安装脚本

#docker run -it --name nginx-dev centos:7 /bin/bash

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

#启动
#/usr/local/nginx/sbin/nginx
#测试
#netstat -ano|grep 80

#编辑
vi /usr/local/nginx/conf/nginx.conf 

#安装php
rpm -Uvh https://mirror.webtatic.com/yum/el7/epel-release.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
yum list
yum install -y php72w php72w-opcache php72w-xml php72w-mcrypt php72w-gd php72w-devel php72w-mysql php72w-intl php72w-mbstring
yum install php72w-fpm

#安装phpredis
pecl install redis

# 加入扩展
# vi /etc/php.d/redis.ini
# extension=redis.so

/usr/sbin/php-fpm -D

ps -ef | grep php-fpm
kill -quit 号
