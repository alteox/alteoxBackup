#!/bin/bash

###### Your config here ######
BUCKET='b2:server-SERVERname'
FOLDER='/home/$$$'
MYSQLUSER='root'
MYSQLPASS='$$$'
DAYS=30
export B2_ACCOUNT_ID="$$$"
export B2_ACCOUNT_KEY="$$$"
export RESTIC_PASSWORD="$$$"

###### Don't touch ######
export RESTIC_REPOSITORY=$BUCKET
#sudo apt --only-upgrade install resic
restic -r $BUCKET init
mysqldump  -u$MYSQLUSER -p$MYSQLPASS --all-databases >$FOLDER/all_dump.sql
restic -r $BUCKET backup $FOLDER
restic -r $BUCKET forget --keep-last $DAYS --prune