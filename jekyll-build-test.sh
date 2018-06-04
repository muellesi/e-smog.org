#!/bin/bash

mkdir -p $PWD/gems         &&
export GEM_HOME=$PWD/gems &&

# prepare the deployment directory
rm -rf ./deploy-test         &&
mkdir ./deploy-test          && 
mkdir ./deploy-test/de   && 
mkdir ./deploy-test/en  && 

# build german site 
cd site-german          &&
bundle install          &&
bundle exec jekyll build --destination ../deploy-test/de --config _config.yml,_config_test.yml &&
cd ..                  # &&

# build english site 
#cd site-english          &&
#bundle install           &&
#bundle exec jekyll build --destination ../deploy-test/en --config _config.yml,_config_test.yml &&
#cd ..