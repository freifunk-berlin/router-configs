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

scp "root@$ip:/etc/config/*" "$dst/fs/etc/config"
scp "root@$ip:/root/.ssh/authorized_keys" "$dst/fs/root/.ssh/"
ssh "root@$ip" opkg list_installed > "$dst/packages"
