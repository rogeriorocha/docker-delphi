#FROM ubuntu:16.04
FROM ubuntu:18.04

LABEL maintainer="rogeriosilvarocha@gmail.com"

RUN \ 
 apt-get -y update

# config TZ 
RUN \ 
 apt-get -y install tzdata && \
 ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
 dpkg-reconfigure -f noninteractive tzdata 

#  RadStudio utils
RUN \
 apt-get -y upgrade && \
 apt-get -y dist-upgrade && \
 apt-get -y install joe wget p7zip-full curl unzip build-essential zlib1g-dev libcurl4-gnutls-dev && \
 apt-get -y install mysecureshell 

# PAServer Rad Studio
WORKDIR /root/PAServer

COPY LinuxPAServer19.0.tar.gz /root/LinuxPAServer19.0.tar.gz
RUN \
 cd /root && \
 tar xzvf LinuxPAServer19.0.tar.gz && \
 cd PAServer-19.0 && \
 mkdir scratch-dir  

 # Microsoft ODBC  17
RUN \
 curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
 curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list && \ 
 apt-get -y install apt-transport-https && \
 apt-get update && \
 ACCEPT_EULA=Y apt-get -y install msodbcsql17 && \
 ACCEPT_EULA=Y apt-get -y install mssql-tools && \
 apt-get -y install unixodbc-dev && \
 apt-get -y install vim 

 #echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile && \
# echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc && \
# source ~/.bashrc && \

#RUN rm /root/.odbc.ini
COPY .odbc.ini /root/

RUN \ 
 apt-get -y autoremove && \
 apt-get -y autoclean 

# Start PAServer
#CMD sed -i 's/ODBC_SERVER/'$ODBC_SERVER'/g' /root/.odbc.ini
COPY start.sh /start.sh
CMD ["/start.sh"]
# sed 's/\r$//' start.sh > start.sh
#/bin/sed -i 's/$ODBC_SERVER/'$ODBC_SERVER'/g' /root/.odbc.ini
#CMD ["/root/PAServer-19.0/paserver","-password=1234"]

ENV ODBC_SERVER tcp:database,1401
ENV ODBC_NAME BANCO
ENV PASERVER_PASSWORD 1234

# Publish PAServer default port
EXPOSE 64211 8080