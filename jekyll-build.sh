#!/bin/bash

mkdir -p $PWD/gems         &&
export GEM_HOME=$PWD/gems &&

# prepare the deployment directory
rm -rf ./deploy         &&
mkdir ./deploy          && 
mkdir ./deploy/de   && 
mkdir ./deploy/en  && 

# build german site 
cd site-german          &&
bundle install          &&
bundle exec jekyll build --destination ../deploy/de --config _config.yml 

#&& mkdir ./deploy/english &&
#jekyll build --source ./site-english/ --destination ./deploy/english --config ./site-english/_config.yml &&