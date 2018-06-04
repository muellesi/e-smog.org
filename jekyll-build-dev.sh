#!/bin/bash

# prepare the deployment directory
rm -rf ./deploy-dev         &&
mkdir ./deploy-dev          && 
mkdir ./deploy-dev/german   && 
mkdir ./deploy-dev/english  && 

# build german site 
cd site-german          &&
bundle exec jekyll build --destination ../deploy-dev/german --config _config.yml,_config_dev.yml --watch

#&& mkdir ./deploy/english &&
#jekyll build --source ./site-english/ --destination ./deploy/english --config ./site-english/_config.yml &&