#!/bin/bash
#
# Database CLI Script
#
# db.sh TASK DB_NAME FILE_NAME CONTAINER
#

TASK="$1"
DB_NAME="$2"
FILE_NAME="$3"
CONTAINER="$4"

# Check Command
if [ -z "$DB_NAME" ]; then
  echo "$0 DB_NAME FILE_NAME"
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

if [ $TASK == "restore" ]; then
  CMD="bash /bin/db/restore.sh $DB_NAME $FILE_NAME"
  container_execute $CONTAINER $CMD
fi

if [ $TASK == "backup" ]; then
  CMD="bash /bin/db/backup.sh $DB_NAME $FILE_NAME"
  container_execute $CONTAINER $CMD
fi
