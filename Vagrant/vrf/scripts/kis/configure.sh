#!/bin/bash

##############
### amazon ###
##############
cat << EOF >> /etc/hosts
10.10.10.100 amazon.vagrant
172.16.255.25 amazon-private.vagrant
EOF

ip link add amazon type vrf table 1
ip link set dev amazon up
ip rule add iif amazon table 1
ip rule add oif amazon table 1

ip link set eth1 master amazon

sleep 5
ip addr add 10.10.10.1/24 dev eth1

sleep 5
ip route add 172.16.255.0/24 via 10.10.10.100 table 1

#################
### microsoft ###
#################
cat << EOF >> /etc/hosts
10.10.10.200 microsoft.vagrant
192.168.0.25 microsoft-private.vagrant
EOF

ip link add microsoft type vrf table 2
ip link set dev microsoft up
ip rule add iif microsoft table 2
ip rule add oif microsoft table 2

ip link set eth2 master microsoft

sleep 5
ip addr add 10.10.10.1/24 dev eth2

sleep 5
ip route add 192.168.0.0/24 via 10.10.10.200 table 2
