From ubuntu:16.04

MAINTAINER Daniel Truong dev@danieltruong.com

##update server

RUN apt-get update \
##install varnish
&& apt-get -y install varnish \
&& rm /etc/varnish/default.vcl \
&& rm /etc/default/varnish
EXPOSE 6082 6081