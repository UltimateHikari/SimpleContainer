#!/bin/bash

# $1 is host number, up to 8 total
# $2 is container number, 2 - 8

ip netns add cont$2
ip link add dev veth$20 type veth peer name veth$21
ip link set dev veth$20 master br0
ip link set veth$20 up

ip link set dev veth$21 netns cont$2
ip -n cont$2 link set dev veth$21 name eth0 address 02:42:c0:a8:0$1:0$2
ip -n cont$2 addr add dev eth0 172.172.0.$2/24
ip -n cont$2 link set dev eth0 up
