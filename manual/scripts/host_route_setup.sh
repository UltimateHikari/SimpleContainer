#!/bin/bash
# $1 - other container num
# $2 - other node num
ip -n overlay neighbor add 10.10.0.$1 lladdr 02:42:c0:a8:00:0$1 dev vxlan1
ip netns exec overlay bridge fdb add 02:42:c0:a8:00:0$1 dev vxlan1 self dst 10.0.0.$2 vni 42 port 4789
