#!/bin/sh

mounted=`df --output=target | egrep "^/mnt/vault/$1"`
if [ -z "$mounted" ]; then
    mount /mnt/vault/$1
fi

st lf /mnt/vault/$1
