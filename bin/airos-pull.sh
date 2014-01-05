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

if [[ $(ls ~/Downloads/XM-*.cfg 2>&- | wc -l) -gt 1 ]]
then
    echo "More than one XM*.cfg in your Download directory. Clean up first."
    exit
fi

cfg=$(echo ~/Downloads/XM-*.cfg)
if [[ ! -f ${cfg} ]]
then
    echo "No XM-*.cfg in your Download directory. Use Ubnt-Backup."
    exit
fi

echo "Writing ${dst}/${cfg##*/}"
cat ${cfg}|sort|sed -e 's,\(password\)=.*,\1=[removed],' > ${dst}/${cfg##*/}
rm -v ${cfg}

#EOF
