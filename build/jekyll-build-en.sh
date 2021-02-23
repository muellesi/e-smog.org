#!/bin/bash

mkdir -p $PWD/gems         &&
export GEM_HOME=$PWD/gems &&

# prepare the deployment directory
mkdir -p ../deploy/en  &&

# build english site 
cd ../sites/en          &&
bundle install          &&
bundle exec jekyll build --destination ../../deploy/en --config _config.yml