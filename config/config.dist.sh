#!/bin/bash

# give your script process a name
ALIAS="Sync Local to S3"

# s3cmd configuration file (created using s3cmd --configure)
# If you have only one configuration file set to ""
S3CMD_CONFIG="-c /root/.s3cfg-custom"

# s3cmd command params (set to "" for no params)
# see http://s3tools.org/usage
# ATTENTION --server-side-encryption is not working in older s3cmd versions;
#           use --add-header=x-amz-server-side-encryption:AES256 instead
S3CMD_PARAMS="--delete-removed --verbose --server-side-encryption"

# Local Data Source
# attention: / is important if you want to copy only the contents
SOURCE="/path/to/folder-name/"

# Destination to S3 (folder-name is optional)
DESTINATION="s3://bucket-name/folder-name/"

# Set upload bandwidth limit (1000 kbps in this example) - (set to "" to disable)
cmd_TRICKLE="$(which trickle) -s -u 1000"

# Send mail after finish - (set to "0" to disable)
do_send_mail=1
mail_to=your_email_here

# Shutdown computer after finish - (set to "0" to disable)
do_shutdown=1
cmd_SHUTDOWN="/sbin/shutdown -h +1"

# Log file
# Directories must be existed
# Take care for myaction.log rotation
BackupLog=/root/scripts/sync-local-to-s3/log/myaction.log
tmpBackupLog=/root/scripts/sync-local-to-s3/log/myaction.tmp.log
top_separator="################################################################################"
separator="--------------------------------------------------------------------------------"
