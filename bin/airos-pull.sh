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

mac=$(ssh "root@$ip" "ip link show dev wifi0"|sed -n 's,.*link/ether \([^ ]\+\) .*,\1,p'|tr a-f A-F)

case ${mac} in "")
	echo "Cannot determine MAC address" >&2
	exit 1
;;esac

ssh "root@$ip" "cat /tmp/running.cfg"|sort|sed -e 's,\(password\)=.*,\1=[removed],' > ${dst}/XM-${mac//:/}.cfg
ssh "root@$ip" "cd /etc && tar -cz \$(find persistent -type f)"| tar -xz -C "$dst"

#EOF
