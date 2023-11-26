# Lua

## 安装 LuaJit

* [The LuaJIT Project](https://luajit.org/index.html)

```sh
cd /usr/local/src
wget wget http://luajit.org/download/LuaJIT-2.0.5.tar.gz
tar -xzvf LuaJIT-2.0.5.tar.gz
cd LuaJIT-2.0.5
make && make install
```

```sh
yum -y git;

git clone https://github.com/simpl/ngx_devel_kit.git
git clone https://github.com/openresty/lua-nginx-module.git
git clone https://github.com/openresty/lua-resty-mysql.git
git clone https://github.com/openresty/lua-resty-redis.git
git clone https://github.com/openresty/lua-resty-string.git
git clone https://github.com/openresty/echo-nginx-module.git

git clone https://github.com/openresty/lua-resty-core.git
git clone https://github.com/openresty/lua-resty-lrucache.git


yum -y install openssl openssl-devel
yum -y install perl perl-devel perl-ExtUtils-Embed
yum -y install libxml2-devel libxslt-devel
yum -y install GeoIP GeoIP-data GeoIP-devel


export LUAJIT_LIB=/usr/local/lib
export LUAJIT_INC=/usr/local/include/luajit-2.0

./configure --prefix=/usr/local/nginx \
--with-http_addition_module  \
--with-http_ssl_module  \
--with-http_sub_module \
--with-http_perl_module \
--with-http_auth_request_module  \
--with-http_flv_module \
--with-http_xslt_module \
--with-http_geoip_module \
--add-module=../ngx_devel_kit \
--add-module=../lua-nginx-module \
--add-module=../echo-nginx-module

make -j2
make install

/usr/local/nginx/sbin/nginx
ps -ef | grep nginx
```

## 安装openresty

openresty 是另一个发行版

* [OpenResty](https://openresty.org/en/)
* [lua-nginx-module](https://github.com/openresty/lua-nginx-module)

```bash
yum-config-manager --add-repo https://openresty.org/package/centos/openresty.repo
yum install openresty
yum install openresty-resty

```
