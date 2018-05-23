#!/bin/bash

# first, build theme gem
cd ./theme-e-smog       &&
./build.sh              &&
cd ..                   &&

# prepare the deployment directory
rm -rf ./deploy-test         &&
mkdir ./deploy-test          && 
mkdir ./deploy-test/german   && 
mkdir ./deploy-test/english  && 

# build german site 
cd site-german          &&
bundle update           &&
bundle exec jekyll build --destination ../deploy-test/german --config _config.yml,_config_test.yml
cd ..

# build german site 
cd site-english          &&
bundle update           &&
bundle exec jekyll build --destination ../deploy-test/english --config _config.yml,_config_test.yml &&
cd ..

#&& mkdir ./deploy/english &&
#jekyll build --source ./site-english/ --destination ./deploy/english --config ./site-english/_config.yml &&