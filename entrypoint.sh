#!/bin/bash

set -e

echo "Setting data port range to ${DATA_PORT_RANGE}"
echo "data_portrange = ${DATA_PORT_RANGE}" > /etc/sane.d/saned.conf

for HOST in ${ALLOW_HOSTS}; do
  echo "Adding $HOST to allowed hosts"
  echo $HOST >> /etc/sane.d/saned.conf
done

for BACKEND in ${BACKENDS}; do
  echo "Adding $BACKEND to allowed backend"
  echo $BACKEND >> /etc/sane.d/dll.conf
done

echo "Launching saned"
/usr/sbin/saned -l -e
