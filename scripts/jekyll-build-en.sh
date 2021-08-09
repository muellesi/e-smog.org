#!/bin/bash

DIRECTORY=$(cd `dirname $0` && pwd)
cd $DIRECTORY

# prepare the deployment directory
mkdir -p ../deploy/en  &&
chmod 777 ../deploy/en &&

# build english site 
cd ../sites/en              &&
bundle install &&
bundle exec jekyll build --destination ../../deploy/en --config _config.yml