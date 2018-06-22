#!/bin/bash

mkdir -p $PWD/gems         &&
export GEM_HOME=$PWD/gems &&

# prepare the deployment directory
rm -rf ./deploy         &&
mkdir ./deploy          && 
mkdir ./deploy/en  && 

# build english site 
cd site-english          &&
bundle install          &&
bundle exec jekyll build --destination ../deploy/en --config _config.yml 