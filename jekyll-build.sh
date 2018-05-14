#!/bin/bash

# first, build theme gem
cd ./theme-e-smog       &&
./build.sh              &&
cd ..                   &&

# prepare the deployment directory
rm -rf ./deploy         &&
mkdir ./deploy          && 
mkdir ./deploy/german   && 
mkdir ./deploy/english  && 

# build german site 
cd site-german          &&
bundle install          &&
bundle exec jekyll build --destination ../deploy/german --config _config.yml 

#&& mkdir ./deploy/english &&
#jekyll build --source ./site-english/ --destination ./deploy/english --config ./site-english/_config.yml &&