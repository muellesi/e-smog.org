#!/bin/bash
rm -rf ./deploy &&
mkdir ./deploy &&
mkdir ./deploy/german &&
jekyll build --source ./site-german/ --destination ./deploy/german --config ./site-german/_config.yml 
#&& mkdir ./deploy/english &&
#jekyll build --source ./site-english/ --destination ./deploy/english --config ./site-english/_config.yml &&