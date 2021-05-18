#!/bin/bash
CGNAME=cont-test
CGPATH=/sys/fs/cgroup
PIDS=3
MEMORY=100000
USER=andy
echo "+cpu" > $CGPATH/cgroup.subtree_control
mkdir -p $CGPATH/$CGNAME
echo "$PIDS" > $CGPATH/$CGNAME/pids.max
echo "$MEMORY" > $CGPATH/$CGNAME/memory.high
chown $USER $CGPATH/$CGNAME/cgroup.procs
