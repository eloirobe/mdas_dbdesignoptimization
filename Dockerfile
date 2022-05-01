FROM mysql:8.0

RUN apt-get update && apt-get install -y git unzip curl wget axel  

RUN touch /etc/apt/sources.list.d/mysql.list
RUN echo 'deb http://repo.mysql.com/apt/debian/ buster mysql-apt-config' > /etc/apt/sources.list.d/mysql.list
RUN echo 'deb http://repo.mysql.com/apt/debian/ buster mysql-8.0' >> /etc/apt/sources.list.d/mysql.list
RUN echo 'deb http://repo.mysql.com/apt/debian/ buster mysql-tools' >> /etc/apt/sources.list.d/mysql.list
RUN echo 'deb-src http://repo.mysql.com/apt/debian/ buster mysql-8.0' >> /etc/apt/sources.list.d/mysql.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29


RUN apt-get update && apt-get install -y bzip2 distro-info-data file libmagic-mgc libmagic1 libmpdec2  libpython3-stdlib \
libpython3.7-minimal libpython3.7-stdlib lsb-release mime-support python3 python3-minimal \
python3.7 python3.7-minimal mysql-shell


