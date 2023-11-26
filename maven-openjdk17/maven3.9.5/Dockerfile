FROM openjdk:17-slim
LABEL maintainer="蔡刚坤"
LABEL author="蔡刚坤"
#maven
# https://hub.docker.com/layers/af0n50/maven-openjdk17-lftp/latest/images/sha256-3ff7f077aecc07acc8157513712914c7ff59bbc3e6edf493611bdafabd211823?context=explore
CMD ["bash"]
ARG MAVEN_VERSION=3.9.5
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/3.9.5/binaries
# Debian 发行版，则可以使用以下命令替换默认源为中科大的镜像
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN sed -i 's/security.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
#
RUN apt update &&\
	apt install curl -y &&\
	apt install lftp -y &&\
	rm -rf /var/lib/apt/lists/*
RUN mkdir -p /usr/share/maven /usr/share/maven/ref &&\
	echo "Downlaoding maven" &&\
	curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz &&\
	echo "Unziping maven"   &&\
	tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1     &&\
	echo "Cleaning and setting links"   &&\
	rm -f /tmp/apache-maven.tar.gz   &&\
	ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
ENV MAVEN_HOME=/usr/share/maven
ENV MAVEN_CONFIG=/.m2
