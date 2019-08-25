#!/bin/sh

info=`df -h --output=target,used,avail | egrep "^/mnt/vault/$1"`
if [ -z "$info" ]; then 
    echo "$1: not mounted"
else
    echo "$1: mounted"
fi
