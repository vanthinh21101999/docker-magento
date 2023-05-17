#!/bin/bash
#
# Reset Magento Script
#
# setup.sh TASK VERSION CONTAINER
#


_CONTAINER="$1"
_TASK="$2"
_USER="$3"
_CMD="$4"

if [ -z "$_CONTAINER" ]; then
    echo "$0 CONTAINER TASK USER CMD"
    exit 1
fi

if [ -z "$_USER" ]; then
    _USER=root
fi

ssh_to_container () {
    docker exec -it -u $_USER $_CONTAINER bash
}

if [ -z "$_TASK" ]; then
    ssh_to_container
    exit 1
fi


if [ $_TASK == "ssh" ]
then
    ssh_to_container
fi

if [ $_TASK == "exec" ]
then
    sudo docker exec -it -u $_USER $_CONTAINER $_CMD
fi