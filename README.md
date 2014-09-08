Docker Grafana
=============

A Grafana frontend with an Nginx proxy to InfluxDB. Uses confd to dynamically update the configuration of Nginx.

Limits proxied requests to GET and OPTIONS methods for security reason. Still if you run this Docker in the wild, you should add a password protection to Nginx.

Example:
```
docker run -d -p 80:80 -e INFLUXDB_HOST=172.17.0.4:8086 -e INFLUXDB_NAME=cadvisor -d --name grafanad -p 8086:80 sybeck2k/grafana
```


Configuration
-------------

 * ```INFLUXDB_HOST```: (default ```172.17.42.1:8086```) sets the influxDB host and port. Attention: use only numeric IPs - Nginx does not use /etc/hosts !
 * ```INFLUXDB_NAME```: (default ```test```)  the name of the DB to use
 * ```INFLUXDB_USER```: (default ```root```)  the username for InfluxDB
 * ```INFLUXDB_PASS```: (default ```root```)  the password for InfuxDB


