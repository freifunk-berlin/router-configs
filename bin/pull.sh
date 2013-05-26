#!/usr/bin/env bash

dst=$1

usage()
{
    echo "Usage:"
    echo "$0 path host"
}

if [[ ! -a $dst ]]
then
    echo "Bad path. Maybe you should use create.sh first?"
    usage
    exit
fi

ip=$2
if [[ -z "$ip" ]]
then
    echo "No host specified."
    usage
    exit
fi

ssh "root@$ip" "sysupgrade -b -" | tar -xz -C "$dst/fs"
ssh "root@$ip" opkg list_installed > "$dst/packages"
