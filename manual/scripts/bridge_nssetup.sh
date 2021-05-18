#!/bin/bash

ip netns add overlay

ip -n overlay link add dev br0 type bridge
ip -n overlay link set br0 up

ip link add dev vxlan1 type vxlan id 42 proxy learning dstport 4789
ip link set vxlan1 netns overlay
ip -n overlay link set vxlan1 master br0
ip -n overlay link set vxlan1 up
