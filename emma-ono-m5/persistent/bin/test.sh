#!/bin/sh

test -n "$1" || exit
trap "killall wget;echo;exit" INT
wget -O /dev/null http://$1/cgi-bin-dev-zero.bin&
sleep 10
killall wget
echo

