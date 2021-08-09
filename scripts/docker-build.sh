#!/bin/bash

DIRECTORY=$(cd `dirname $0` && pwd)
cd $DIRECTORY

cd ../

docker run --rm \
  --volume="$PWD:/srv/jekyll" \
  --volume="$PWD/vendor/bundle:/usr/local/bundle" \
  -it jekyll/builder bash -c "./scripts/jekyll-build.sh"