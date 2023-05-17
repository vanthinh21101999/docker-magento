#!/usr/bin/env bash

CONTAINER_NAME=magento

DOCKER_MAGENTO_PATH="/home/laptc/Workspace/docker"
cd $DOCKER_MAGENTO_PATH
bash bin/execute.sh $CONTAINER_NAME
