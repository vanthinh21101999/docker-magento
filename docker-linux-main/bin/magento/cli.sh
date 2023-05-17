#!/usr/bin/env bash
#
# Run Magento CLI Script
#
# cli.sh VERSION
#

TASK="$1"
VERSION="$2"

# Check Command
# shellcheck disable=SC2157
if [ -z "TASK" ]; then
    echo "$0 TASK VERSION"
    exit 1
fi

MAGENTO_PATH=/var/www/html
MAGENTO_CLI=$MAGENTO_PATH/bin/magento

change_owner(){
    echo "Changing owner"
    chown -R 1000:1000 $MAGENTO_PATH/
    chown -R www-data:www-data $MAGENTO_PATH/var/session
    chmod -R 777 $MAGENTO_PATH/pub/static/ $MAGENTO_PATH/generated/ $MAGENTO_PATH/var/ $MAGENTO_PATH/pub/media/
}

cron_run () {
    echo "Running CRON"
    php $MAGENTO_CLI cron:run
    change_owner
    echo "Done"
}

clear_cache () {
    echo "Flushing cache"
    php $MAGENTO_CLI cache:flush
    change_owner
    echo "Done"
}

upgrade () {
    echo "Upgrading"
    php $MAGENTO_CLI setup:upgrade
    change_owner
    echo "Done"
}

go_live () {
    echo "Changing to production"
    php $MAGENTO_CLI d:m:set production
    change_owner
    echo "Done"
}

go_dev () {
    echo "Changing to developer"
    php $MAGENTO_CLI d:m:set developer
    change_owner
    echo "Done"
}

reindex () {
    echo "Reindexing"
    php $MAGENTO_CLI indexer:reindex
    change_owner
    echo "Done"
}

deploy_sample_data () {
    echo "Deploying SampleData"
    php $MAGENTO_CLI sampledata:deploy
    change_owner
    echo "Done"
}

update_vendor () {
    if [ -z "VERSION" ]; then
      echo "$0 TASK VERSION"
      exit 1
    fi

    echo "Updating Vendor"


    BACKUP_PATH=/var/www/backup/$VERSION

    cp $BACKUP_PATH/composer.json $MAGENTO_PATH/
    cp $BACKUP_PATH/composer.lock $MAGENTO_PATH/

    if [[ -f $BACKUP_PATH/auth.json ]]
    then
      cp $BACKUP_PATH/auth.json $MAGENTO_PATH/
    fi

    cd $MAGENTO_PATH
    composer install
    change_owner
    echo "Done"
}


if [ $TASK == "c:f" ]
then
    clear_cache
fi

if [ $TASK == "s:up" ]
then
    upgrade
fi

if [ $TASK == "chown" ]
then
    change_owner
fi

if [ $TASK == "go-live" ]
then
    go_live
fi

if [ $TASK == "go-dev" ]
then
    go_dev
fi

if [ $TASK == "reindex" ]
then
    reindex
fi

if [ $TASK == "c:u" ]
then
    update_vendor
fi

if [ $TASK == "cron" ]
then
    cron_run
fi

if [ $TASK == "sample-data" ]
then
    deploy_sample_data
fi
