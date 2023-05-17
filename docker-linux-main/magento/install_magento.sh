#!/bin/bash
#
# Install Magento Script
#
# install_magento DATABASE_NAME URL
#

# Check Command
if [ -z "$1" ]; then
    echo "$0 PROJECTCODE"
    exit 1
fi

PROJECTCODE=$1
HOST=db_$1
ESHOST=es_$1
URL=http://dev.local:3080/


# Create Database
echo "<?php \
    \$conn = new PDO('mysql:host=$HOST', 'root', 'admin123'); \
    \$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); \
    \$conn->exec('CREATE DATABASE IF NOT EXISTS $1'); \
    " | php

# Install magento
php bin/magento setup:install --use-rewrites=1 \
    --db-host=$HOST \
    --db-name=$1 \
    --db-user=root \
    --db-password=admin123 \
    --db-prefix=m_ \
    --admin-firstname=Admin \
    --admin-lastname=Admin \
    --admin-email=info@laptc.dev \
    --admin-user=admin \
    --admin-password=admin123 \
    --base-url=$URL \
    --backend-frontname=admin \
    --admin-use-security-key=0 \
    --language=en_US \
    --currency=USD \
    --timezone=America/Chicago \
    --search-engine=elasticsearch7 \
    --elasticsearch-host=$ESHOST  \
    --elasticsearch-port=9200 \
    --key=8f1e9249ca82c072122ae8d08bc0b0cf

# Update config for testing
php bin/magento config:set cms/wysiwyg/enabled disabled
php bin/magento config:set admin/security/admin_account_sharing 1
php bin/magento config:set admin/captcha/enable 0
php bin/magento config:set admin/security/password_is_forced 0
php bin/magento config:set admin/security/session_lifetime 86400
php bin/magento config:set web/cookie/cookie_lifetime 86400
php bin/magento module:disable Magento_TwoFactorAuth
