#!/bin/bash

set -e

echo "Setting data port range to ${DATA_PORT_RANGE}"
echo "data_portrange = ${DATA_PORT_RANGE}" > /etc/sane.d/saned.conf

for HOST in ${ALLOW_HOSTS}; do
  echo "Adding $HOST to allowed hosts"
  echo $HOST >> /etc/sane.d/saned.conf
done

echo "Launching saned"
inetd -f -e
