#!/bin/bash
# $1 - current container num, $2 - ipv4 of other node
ip -n overlay ip neighbor add 192.168.0.$1 lladdr 02:42:c0:a8:00:0$1 dev vxlan1
ip -n overlay bridge fdb add 02:42:c0:a8:00:0$1 dev vxlan1 self dst $2 vni 42 port 4789
