#!/bin/bash
while true; do

copyloc=$1
copydest=$2

inotifywait -e modify,create,delete -r $copyloc && \
./syncs3.sh $copyloc $copydest

done
