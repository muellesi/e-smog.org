#!/bin/bash

# first, build theme gem
cd ./theme-e-smog       &&
bundle install --force  &&
chmod +x build.sh       &&
./build.sh              &&
cd ..                   &&

# prepare the deployment directory
rm -rf ./deploy-test         &&
mkdir ./deploy-test          && 
mkdir ./deploy-test/german   && 
mkdir ./deploy-test/english  && 

# build german site 
cd site-german          &&
bundle install --force  &&
bundle exec jekyll build --destination ../deploy-test/german --config _config.yml,_config_test.yml &&
cd ..

# build english site 
cd site-english          &&
bundle install --force   &&
bundle exec jekyll build --destination ../deploy-test/english --config _config.yml,_config_test.yml &&
cd ..