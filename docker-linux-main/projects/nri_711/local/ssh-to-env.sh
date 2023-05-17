#!/usr/bin/env bash

CONTAINER_NAME=fpm_nri_711

PROJECT_ROOT=$(dirname $(dirname $(dirname $(dirname $(readlink -fm $0)))))
bash $PROJECT_ROOT/bin/execute.sh $CONTAINER_NAME
