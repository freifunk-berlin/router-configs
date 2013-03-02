#!/usr/bin/env bash

dst=$1

if [ -a $dst ]
then
    echo "$dst does already exist. Nothing to do."
    exit
fi

cp -r template $dst
