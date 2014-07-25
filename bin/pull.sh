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

test -d "$dst"/fs/etc/config && ./bin/uci-sort.pl "$dst"/fs/etc/config/*

# remove wireless keys if present
sed -i.backup '/key/d' "$dst/fs/etc/config/wireless"
sed -i.backup '/password/d' "$dst/fs/etc/icecast.xml"
## remove other private files
# list of files
files="$dst/fs/etc/passwd $dst/fs/etc/shadow $dst/fs/etc/openvpn/*.conf $dst/fs/etc/openvpn/*.key $dst/fs/etc/dropbear/dropbear_* $dst/fs/etc/uhttpd.* $dst/fs/lib/uci/upload/cbid.openvpn.*"
echo "$files"
for f in $files; do
	if [ -f $f ]; then
		rm $f
	fi
done

#EOF
