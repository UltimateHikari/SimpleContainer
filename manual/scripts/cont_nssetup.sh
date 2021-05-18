#!/bin/bash

# $1 is container number, 2 - 8

ip netns add cont$1
ip link add dev veth$10 type veth peer name veth$11
ip link set dev veth$10 netns overlay
ip -n overlay link set dev veth$10 master br0
ip -n overlay link set veth$10 up

ip link set dev veth$11 netns cont$1
ip -n cont$1 link set dev veth$11 name eth0 address 02:42:c0:a8:00:0$1
ip -n cont$1 addr add dev eth0 10.0.0.$1/24
ip -n cont$1 link set dev eth0 up
