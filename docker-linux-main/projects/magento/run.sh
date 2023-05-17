#!/usr/bin/env bash

CMD="$1"

DEFAULT_CONFIG="config.yml"

DOCKER_COMPOSE_BIN_PATH="/snap/bin"

export_docker_compose_path () {
    if ([ ! -z $DOCKER_COMPOSE_BIN_PATH ] && [ -d $DOCKER_COMPOSE_BIN_PATH ])
    then
        export PATH=$PATH:$DOCKER_COMPOSE_BIN_PATH
    fi
}

compose_up () {
    if [ -z $CMD ]
    then
        CMD="up -d"
    fi

    export_docker_compose_path

    docker-compose -f $DEFAULT_CONFIG $CMD

}

compose_up
