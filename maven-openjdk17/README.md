#

* 确认maven版本存在https://apache.osuosl.org/maven/maven-3/

##

```sh
cd maven-openjdk17

#缓存清理
docker builder prune

#
docker build -t maven-openjdk17:bulleye .
docker rmi  maven-openjdk17:bulleye
docker run -it --rm maven-openjdk17:bulleye

#
docker build -t maven-openjdk17:manen3.9.5 maven3.9.5
docker rmi  maven-openjdk17:manen3.9.5  
docker run -it --rm maven-openjdk17:manen3.9.5
#

```


##

```sh
# #openjdk:17-slim
# FROM oraclelinux:8-slim
# CMD ["bash"]
# /bin/sh -c set -eux; apt-get update; apt-get install -y --no-install-recommends ca-certificates p11-kit ; rm -rf /var/lib/apt/lists/*
# ENV JAVA_HOME=/usr/local/openjdk-17
# ENV PATH=/usr/local/openjdk-17/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# ENV LANG=C.UTF-8
# ENV JAVA_VERSION=17.0.2
# /bin/sh -c set -eux; arch="$(dpkg --print-architecture)"; case "$arch" in 'amd64') downloadUrl='https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_linux-x64_bin.tar.gz'; downloadSha256='0022753d0cceecacdd3a795dd4cea2bd7ffdf9dc06e22ffd1be98411742fbb44'; ;; 'arm64') downloadUrl='https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_linux-aarch64_bin.tar.gz'; downloadSha256='13bfd976acf8803f862e82c7113fb0e9311ca5458b1decaef8a09ffd91119fa4'; ;; *) echo >&2 "error: unsupported architecture: '$arch'"; exit 1 ;; esac; savedAptMark="$(apt-mark showmanual)"; apt-get update; apt-get install -y --no-install-recommends wget ; rm -rf /var/lib/apt/lists/*; wget --progress=dot:giga -O openjdk.tgz "$downloadUrl"; echo "$downloadSha256 *openjdk.tgz" | sha256sum --strict --check -; mkdir -p "$JAVA_HOME"; tar --extract --file openjdk.tgz --directory "$JAVA_HOME" --strip-components 1 --no-same-owner ; rm openjdk.tgz*; apt-mark auto '.*' > /dev/null; [ -z "$savedAptMark" ] || apt-mark manual $savedAptMark > /dev/null; apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; { echo '#!/usr/bin/env bash'; echo 'set -Eeuo pipefail'; echo 'trust extract --overwrite --format=java-cacerts --filter=ca-anchors --purpose=server-auth "$JAVA_HOME/lib/security/cacerts"'; } > /etc/ca-certificates/update.d/docker-openjdk; chmod +x /etc/ca-certificates/update.d/docker-openjdk; /etc/ca-certificates/update.d/docker-openjdk; find "$JAVA_HOME/lib" -name '*.so' -exec dirname '{}' ';' | sort -u > /etc/ld.so.conf.d/docker-openjdk.conf; ldconfig; java -Xshare:dump; fileEncoding="$(echo 'System.out.println(System.getProperty("file.encoding"))' | jshell -s -)"; [ "$fileEncoding" = 'UTF-8' ]; rm -rf ~/.java; javac --version; java --version
# CMD ["jshell"]



ARG MAVEN_VERSION=3.9.5
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/3.9.5/binaries

# RUN mkdir -p /usr/share/maven /usr/share/maven/ref   && echo "Downlaoding maven"   && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz && echo "Unziping maven"   && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1     && echo "Cleaning and setting links"   && rm -f /tmp/apache-maven.tar.gz   && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn # buildkit
# ENV MAVEN_HOME=/usr/share/maven \
# 	MAVEN_CONFIG=/.m2
```