#!/usr/bin/env bash

PROJECT_ROOT=$(dirname $(dirname $(dirname $(dirname $(readlink -fm $0)))))

update_permission () {
    sudo chown -R $USER:$GROUP $PROJECT_ROOT/services/;
    sudo chmod -R 777 $PROJECT_ROOT/services/;
}

update_permission
