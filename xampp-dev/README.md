# xampp-dev

[xampp7.3下载地址](https://excellmedia.dl.sourceforge.net/project/xampp/XAMPP%20Linux/7.3.10/xampp-linux-x64-7.3.10-1-installer.run)

## 配置修改

- etc/httpd.conf 启动虚拟机 httpd-vhosts.conf

- etc/extra/httpd-vhosts.conf 中配置服务

- etc/extra/httpd-xampp.conf 中修改phpmyadmin 权限

- etc/my.cnf 中 加入

```
[mysqld]
lower_case_table_names=1
```

## docker常用命令

删除容器：`docker rm gentou`

创建容器：`docker run -p 8020:8000 -v $(pwd):/var/local/www  --name gentou cgk-xampp-dev:latest`

终端操作：`docker exec -i -t gentou -i -t`

重启服务：`docker exec gentou /opt/lampp/xampp restart`

---
## 导入数据库

`/opt/lampp/bin/mysql  --database=test  < "/var/local/www/db/gentou_20190411.sql"`

`docker exec gentou /opt/lampp/bin/mysql  --database=test  < "/var/local/www/db/gentou_20190411.sql"`

SELECT CONCAT('drop table ',table_name,';') FROM information_schema.`TABLES` WHERE table_schema='test';

rm -f /opt/lampp/logs/*
