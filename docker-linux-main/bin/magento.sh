#!/bin/bash
#
# Magento CLI Script
#
# magento.sh TASK VERSION CONTAINER
#

TASK="$1"
VERSION="$2"
CONTAINER="$3"

# Check Command
if [ -z "$VERSION" ]; then
  echo "$0 TASK VERSION CONTAINER"
  exit 1
fi

if [ -z "$CONTAINER" ]; then
  echo "Container ID could not be empty"
  exit 1
fi

container_execute() {
  # shellcheck disable=SC2068
  docker exec -it -u root $@
}

CMD="bash /bin/magento/cli.sh $VERSION $TASK"
container_execute $CONTAINER $CMD
