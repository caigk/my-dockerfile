FROM debian:bullseye
LABEL maintainer="蔡刚坤"
LABEL author="蔡刚坤"
#maven
# https://hub.docker.com/layers/af0n50/maven-openjdk17-lftp/latest/images/sha256-3ff7f077aecc07acc8157513712914c7ff59bbc3e6edf493611bdafabd211823?context=explore
CMD ["bash"]
# Debian 发行版，则可以使用以下命令替换默认源为中科大的镜像
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN sed -i 's/security.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
#
RUN set -eux && apt-get update && apt-get install -y --no-install-recommends ca-certificates p11-kit &&\
	apt update  &&\
	apt install openjdk-17-jdk -y &&\
	apt install curl -y &&\
	apt install lftp -y &&\
	apt install maven -y &&\
	rm -rf /var/lib/apt/lists/*

