#!/bin/bash

echo '10.10.10.1 kis.vagrant' >> /etc/hosts

ip link add link eth1 name subnet type macvlan

sleep 5

ip addr add 192.168.0.25/24 dev subnet
