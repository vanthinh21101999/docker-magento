#!/bin/bash
#
# Restore Magento ENV Script
#
# restore-env.sh PROJECTCODE
#

PROJECTCODE="$1"

# Check Command
if [ -z "PROJECTCODE" ]; then
    echo "$0 PROJECTCODE"
    exit 1
fi

BACKUP_FOLDER=/var/www/backup
MAGENTO_PATH=/var/www/html

restore_env () {
    SOURCE_CONFIG=$BACKUP_FOLDER/$VERSION/config.php
    SOURCE_ENV=$BACKUP_FOLDER/$VERSION/env.php
    ETC_PATH=$MAGENTO_PATH/app/etc/

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

    echo "Install Config + ENV files"
    cp $SOURCE_CONFIG $ETC_PATH
    cp $SOURCE_ENV $ETC_PATH

    echo "Changing owner"
    chown -R www-data:www-data $ETC_PATH

    echo "Done"
}

restore_env
