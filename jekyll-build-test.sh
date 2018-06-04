#!/bin/bash

mkdir -p $PWD/gems         &&
export GEM_HOME=$PWD/gems &&

# prepare the deployment directory
rm -rf ./deploy-test         &&
mkdir ./deploy-test          && 
mkdir ./deploy-test/german   && 
mkdir ./deploy-test/english  && 

# build german site 
cd site-german          &&
bundle install          &&
bundle exec jekyll build --destination ../deploy-test/german --config _config.yml,_config_test.yml &&
cd ..                  # &&

# build english site 
#cd site-english          &&
#bundle install           &&
#bundle exec jekyll build --destination ../deploy-test/english --config _config.yml,_config_test.yml &&
#cd ..