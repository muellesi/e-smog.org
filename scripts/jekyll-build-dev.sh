#!/bin/bash

DIRECTORY=$(cd `dirname $0` && pwd)
cd $DIRECTORY

# prepare the deployment directory
rm -rf ../deploy/dev         &&
mkdir ../deploy/dev          && 
mkdir ../deploy/dev/de   && 
mkdir ../deploy/dev/en  && 

# build german site 
cd ../sites         &&

cd de &&
bundle install &&
bundle exec jekyll build --destination ../../deploy/dev/de --config _config.yml,_config_dev.yml --watch

# cd en &&
# bundle install &&
# bundle exec  jekyll build --destination ../deploy/dev/en --config _config.yml,_config_dev.yml --watch &&