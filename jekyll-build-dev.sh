#!/bin/bash

# first, build theme gem
cd ./theme-e-smog       &&
./build.sh              &&
cd ..                   &&

# prepare the deployment directory
rm -rf ./deploy-dev         &&
mkdir ./deploy-dev          && 
mkdir ./deploy-dev/german   && 
mkdir ./deploy-dev/english  && 

# build german site 
cd site-german          &&
bundle update           &&
bundle exec jekyll serve --destination ../deploy-dev/german --config _config.yml,_config_dev.yml --watch

#&& mkdir ./deploy/english &&
#jekyll build --source ./site-english/ --destination ./deploy/english --config ./site-english/_config.yml &&