#!/bin/bash

# post update

# When composer updates WP, it downloads the latest version
# which includes a fresh copy of wp-config. If left in the wp/
# directory, it will conflict with the wp-config in web/
if [ -e web/wp/wp-config.php ]
then

  rm web/wp/wp-config*

fi


if [ -e web/wp/uploads/ ]
then

  rm -rf web/wp/uploads

fi
