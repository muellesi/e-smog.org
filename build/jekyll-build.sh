#!/bin/bash

# prepare the deployment directory
mkdir -p ../deploy/de   && 

# build german site 
cd ../sites/de              &&
bundle install &&
bundle exec jekyll build --destination ../../deploy/de --config _config.yml