#!/bin/bash
if [ ! -e backups/ ]
then

  mkdir backups

fi

. ./bin/provisioning/scripts/project.sh

DATABASE_NAME=$(project '.database_name' )
DEV_URL=$(project '.dev_url')
LOCAL_URL=$(project '.local_url')

echo "cleaning out the backups directory"
rm -rf backups/database.sql.gz

echo "creating backup on pantheon"
terminus backup:create zkf-composer.dev --element=db

echo "pulling backup locally"
terminus backup:get zkf-composer.dev --element=db --to=./backups/database.sql.gz

echo "opening backup"
gunzip ./backups/database.sql.gz

echo "doing a find and replace"
sudo sed -i -e "s/$DEV_URL/$LOCAL_URL/g" ./backups/database.sql
