#!/bin/bash

#v=$1

#echo veth$1 to veth$((v+1))

ip netns add cont2
ip link add dev veth0 type veth peer name veth1
ip link set dev veth0 netns overlay
ip -n overlay link set dev veth0 master br0
ip -n overlay link set veth0 up

ip link set dev veth1 netns cont2
ip -n cont2 link set dev veth1 name eth0 address 02:42:c0:a8:00:03
ip -n cont2 addr add dev eth0 192.168.0.3/24
ip -n cont2 link set dev eth0 up
