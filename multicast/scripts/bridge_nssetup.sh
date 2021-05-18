#!/bin/bash

# 172.172.0.0/24 - container network

ip link add dev br0 type bridge
ip link set br0 up

ip link add dev vxlan1 type vxlan \
    id 42 dstport 4789 group 239.1.1.1 dev eth0
ip link set vxlan1 master br0
ip link set vxlan1 up
