#!/bin/bash
# $1 - current container num
# $2 - ipv4 of other node
# $3 - host number
ip -n overlay ip neighbor add 172.172.0.$1 lladdr 02:42:c0:a8:0$3:0$1 dev vxlan1
ip -n overlay bridge fdb add 02:42:c0:a8:0$3:0$1 dev vxlan1 self dst $2 vni 42 port 4789
