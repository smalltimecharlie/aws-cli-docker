#!/bin/bash

timestamp=$(date +"%F %r")

copyloc=$1
copydest=$2

backlogfile="s3bakstatus.log"


s3cmd sync -r $copyloc $copydest

if [ $? -eq 0 ];then
   echo "Backup Completed Successfully at $timestamp"  >> "$backlogfile"
else
   echo "Backup Failed at $timestamp"  >> "$backlogfile"
fi
