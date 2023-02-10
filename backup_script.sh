#!/bin/bash

# Set up the variables
DATE=$(date +%Y-%m-%d)
BACKUP_DIR="{{ db_backup_dir }}"
MYSQL_USER="{{ db_user }}"
MYSQL_PASSWORD="{{ db_password }}"
MYSQL_HOST="{{ db_host }}"
MYSQL_DB="{{ db_name }}"

# Create the backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p "$BACKUP_DIR"
fi

# Dump the database
mysqldump --user=$MYSQL_USER --password=$MYSQL_PASSWORD --host=$MYSQL_HOST $MYSQL_DB > "$BACKUP_DIR/$MYSQL_DB-$DATE.sql"

# Compress the backup file
gzip "$BACKUP_DIR/$MYSQL_DB-$DATE.sql"
