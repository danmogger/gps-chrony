#!/bin/sh

gpsd ${DEVICE} -n -F /var/run/gpsd.sock -P /run/gpsd/gpsd.pid -G

chronyd -n -f /etc/chrony/chrony.conf

#sleep infinity
