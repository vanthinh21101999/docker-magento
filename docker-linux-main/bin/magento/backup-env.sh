#!/bin/bash
#
# Backup Magento ENV Script
#
# backup-env.sh PROJECTCODE
#

PROJECTCODE="$1"

# Check Command
if [ -z "PROJECTCODE" ]; then
    echo "$0 PROJECTCODE"
    exit 1
fi

BACKUP_FOLDER=/var/www/backup
MAGENTO_PATH=/var/www/html

backup_env () {
    SOURCE_CONFIG=$MAGENTO_PATH/app/etc/config.php
    SOURCE_ENV=$MAGENTO_PATH/app/etc/env.php
    BACKUP_PATH=$BACKUP_FOLDER/$PROJECTCODE

    declare -a REQUIRED_OPTIONS
    REQUIRED_OPTIONS["source_config"]=$SOURCE_CONFIG
    REQUIRED_OPTIONS["source_env"]=$SOURCE_ENV

    for option in ${REQUIRED_OPTIONS[@]}
    do
        if [ ! -f $option ]
        then
            echo $option
            echo "Source file not found!"
            exit 1
        fi
    done

    echo "Removing backup folder if exist"
    rm -Rf $BACKUP_PATH

    echo "Creating new backup folder"
    mkdir -p $BACKUP_PATH

    echo "Backing up config"
    cp $SOURCE_CONFIG $BACKUP_PATH

    echo "Backing up ENV"
    cp $SOURCE_ENV $BACKUP_PATH

    echo "Changing owner"
    chown -R www-data:www-data $BACKUP_PATH

    echo "Done"
}

backup_env
