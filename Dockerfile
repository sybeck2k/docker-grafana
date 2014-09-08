FROM ubuntu:14.04
MAINTAINER Roberto Migli <robertomigli@gmail.com>

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl perl nginx-full

RUN curl http://grafanarel.s3.amazonaws.com/grafana-1.7.0.tar.gz | tar zx
RUN mv grafana-1.7.0 /opt/grafana
RUN chmod -R 755 /opt/grafana/

#Remove default sites
RUN rm /etc/nginx/sites-enabled/*
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN echo "error_log /dev/stdout info;" >> /etc/nginx/nginx.conf

ADD nginx-grafana.conf /etc/nginx/sites-enabled/grafana.conf


ADD config.js.tpl /

ENV INFLUXDB_HOST 172.17.42.1:8086
ENV INFLUXDB_NAME test
ENV INFLUXDB_USER root
ENV INFLUXDB_PASS root

ADD run.sh /run.sh
RUN chmod u+x /run.sh

EXPOSE 80

CMD ["/run.sh"]

