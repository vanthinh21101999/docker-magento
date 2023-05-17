#!/bin/bash
#
# Restore DB Script
#
# restore.sh DB_NAME
#

DB_NAME="$1"
BACKUP_FILE_NAME="$2"

# Check Command
if [ -z "$DB_NAME" ]; then
  echo "$0 DB_NAME BACKUP_FILE_NAME"
  exit 1
fi

if [ -z "$BACKUP_FILE_NAME" ]; then
  BACKUP_FILE_NAME=$DB_NAME
fi

BACKUP_FOLDER=/backup
DB_USER=root
DB_PASSWROD=admin123

echo "Start Restore Database: $DB_NAME from $BACKUP_FILE_NAME.sql"
mysql -u $DB_USER -p$DB_PASSWROD -e "CREATE DATABASE IF NOT EXISTS $DB_NAME"
mysql -u $DB_USER -p$DB_PASSWROD $DB_NAME <$BACKUP_FOLDER/$BACKUP_FILE_NAME.sql
echo "Done"
