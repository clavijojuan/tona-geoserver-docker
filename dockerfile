# syntax=docker/dockerfile:1
FROM ubuntu:latest

RUN apt update && apt upgrade

RUN apt-get install wget -y
RUN apt-get install unzip -y

RUN apt-get install openjdk-11-jdk -y

RUN mkdir "geoserver"

RUN cd "geoserver"

RUN wget "https://sourceforge.net/projects/geoserver/files/GeoServer/2.22.0/geoserver-2.22.0-bin.zip"

RUN unzip "geoserver-2.22.0-bin.zip"

EXPOSE 8080

# RUN rm -r "data_dir"

# RUN mkdir "data_dir"

# RUN cd ".."

# RUN mv "/data_dir" "/geoserver/data_dir"

# COPY . .

# RUN cd "geoserver"
ENV GEOSERVER_DATA_DIR "/data_dir"
ENV GEOWEBCACHE_CACHE_DIR "/data_dir/gwc"
ENV LANG=es_ES.UTF-8
ENV Djavax.servlet.response.encoding=UTF-8

ENTRYPOINT ["/bin/startup.sh"]
