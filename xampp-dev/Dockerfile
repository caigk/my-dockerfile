FROM centos:7

RUN yum -y install wget net-tools

WORKDIR /opt
RUN wget https://excellmedia.dl.sourceforge.net/project/xampp/XAMPP%20Linux/7.3.10/xampp-linux-x64-7.3.10-1-installer.run
RUN chmod a+x xampp-linux-x64-7.3.10-1-installer.run
RUN ./xampp-linux-x64-7.3.10-1-installer.run --mode unattended
RUN rm -f xampp-linux-x64-7.3.10-1-installer.run

COPY conf/ /opt/lampp/

VOLUME [ "/var/local/www" ]

EXPOSE 80 8000

