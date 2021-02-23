#!/bin/bash

# prepare the deployment directory
mkdir -p ../deploy/en  &&

# build english site 
cd ../sites/en              &&
bundle install &&
bundle exec jekyll build --destination ../../deploy/en --config _config.yml