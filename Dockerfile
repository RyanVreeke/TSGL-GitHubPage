FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /home

RUN apt-get update && apt-get -y upgrade 
RUN apt-get -y install sudo
RUN apt-get -y install apt-utils
RUN apt-get -y install -f wget
RUN apt-get -y install make
RUN apt-get -y install tzdata
RUN apt-get -y install git
RUN git clone https://github.com/samuelth47/TSGL.git

WORKDIR /home/TSGL

RUN git pull
RUN cp -r stb /usr/include
RUN cp -r Windows /usr/include
RUN cp -r src/TSGL /usr/include
RUN cp -r src/TSGL/tsgl.h /usr/include
RUN cp -r assets /usr/include/TSGL
RUN export DISPLAY=153.106.94.182:0.0
RUN ./install-ubuntu.sh

LABEL org.opencontainers.image.source="https://github.com/RyanVreeke/TSGL-GitHubPage"

CMD ["/bin/bash", "cd /home/TSGL", "make && make install"]
