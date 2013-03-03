#!/usr/bin/env bash

dst=$1

if [[ ! -a $dst ]]
then
    echo "$dst does not exist. Nothing to do."
    exit
fi

ip=$2
if [[ -z "$ip" ]]
then
    echo "Second paramter must be a ip."
    exit
fi

ssh "root@$ip" "sysupgrade -b -" | tar -xz -C "$dst/fs"
ssh "root@$ip" opkg list_installed > "$dst/packages"
