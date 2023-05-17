#!/usr/bin/env bash

_SERVER="$1"
_TASK="$2"

if [ -z $_SERVER ]
then
    _SERVER="nginx"
fi

if [ -z $_TASK ]
then
    _TASK="install"
fi

APP_ROOT=$(dirname $(dirname $(readlink -fm $0)))
_CONFIG_FILE_NAME=docker.conf

_NGINX_SOURCE_CONFIG=$APP_ROOT/etc/nginx/$_CONFIG_FILE_NAME
_NGINX_CONFIG_PATH=/etc/nginx/conf.d

_APACHE_SOURCE_CONFIG=$APP_ROOT/etc/apache/$_CONFIG_FILE_NAME
_APACHE_CONFIG_PATH=/etc/apache2/sites-available

install_nginx () {
    echo "Installing Nginx..."
    apt-get update && apt-get -y install nginx;

    update_nginx
}

install_apache () {
    echo "Installing Apache..."
    apt-get update && apt-get -y install apache2;

    echo "Adjusting the Firewall..."
    ufw allow 'Apache'

    update_apache
}

update_nginx () {

    echo "Updating nginx config..."
    yes | cp $_NGINX_SOURCE_CONFIG $_NGINX_CONFIG_PATH

    echo "Testing nginx configuration file..."
    service nginx configtest

    echo "Reloading nginx service..."
    service nginx reload

    echo "Done."
}

update_apache () {

    echo "Updating apache config..."
    yes | cp $_APACHE_SOURCE_CONFIG $_APACHE_CONFIG_PATH

    echo "Enabling site configration..."
    a2ensite $_CONFIG_FILE_NAME

    echo "Testing apache configuration..."
    apache2ctl configtest

    echo "Reloading apache service..."
    service apache2 reload

    echo "Done."
}

install () {
    if [ $_SERVER == "nginx" ]
    then
        install_apache
    fi

    if [ $_SERVER == "apache" ]
    then
        install_nginx
    fi
}

update () {
    if [ $_SERVER == "nginx" ]
    then
        update_nginx
    fi

    if [ $_SERVER == "apache" ]
    then
        update_apache
    fi
}

if [ $_TASK == "install" ]
then
    install
fi

if [ $_TASK == "update" ]
then
    update
fi
