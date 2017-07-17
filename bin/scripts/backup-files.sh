#!/bin/bash

if [ ! -e backups/ ]
then

  mkdir backups

fi

DATE=`date +%Y-%m-%d-%H%M%S`

echo "cleaning out old backups"
rm -rf backups/files.tar.gz

echo "creating backup on pantheon"
terminus backup:create zkf-composer.dev --element=files

echo "pulling backup locally"
terminus backup:get zkf-composer.dev --element=files --to=./backups/files.tar.gz

echo "opening backup"
if [ -e web/wp-content/uploads/ ]
then

  rm -rf web/wp-content/uploads

fi

tar xf ./backups/files.tar.gz -C ./web/wp-content
mv ./web/wp-content/files_dev/ ./web/wp-content/uploads

