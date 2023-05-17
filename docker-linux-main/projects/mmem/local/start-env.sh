#!/usr/bin/env bash

PROJECT_ROOT=$(dirname $(dirname $(readlink -fm $0)))
bash $PROJECT_ROOT/run.sh
