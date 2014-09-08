#!/bin/bash

perl -p -e 's/\$\{([^}]+)\}/defined $ENV{$1} ? $ENV{$1} : $&/eg' < /config.js.tpl > /opt/grafana/config.js
sed -i.original "s/INFLUXDB_HOST/$INFLUXDB_HOST/g;s/INFLUXDB_NAME/$INFLUXDB_NAME/g" /etc/nginx/sites-enabled/grafana.conf

nginx

