#!/bin/bash

#v=$1

#echo veth$1 to veth$((v+1))

ip netns add cont1
ip link add dev veth0 type veth peer name veth1
ip link set dev veth0 netns overlay
ip -n overlay link set dev veth0 master br0
ip -n overlay link set veth0 up

ip link set dev veth1 netns cont1
ip -n cont1 link set dev veth1 name eth0 address 02:42:c0:a8:00:02
ip -n cont1 addr add dev eth0 192.168.0.2/24
ip -n cont1 link set dev eth0 up
