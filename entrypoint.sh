#!/bin/bash

sh configure_s3cmd.sh

sh watch_and_sync.sh $DIR_TO_SYNC $BUCKET_SYNC_LOCATION