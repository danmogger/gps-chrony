#!/bin/sh

gpsd ${DEVICE} -n -b -r -F /var/run/gpsd.sock -P /run/gpsd/gpsd.pid -G

chronyd -m -d -f /etc/chrony/chrony.conf

#sleep infinity
