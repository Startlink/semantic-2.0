#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: ./build.sh commit-message"
  exit;
fi

cd semantic/
if [ -d dist ]; then
  rm -rf dist/
fi

git clone https://github.com/Startlink/semantic-2.0-dist.git dist/

gulp build
cd dist
git add -A
git commit -m "$1"
git push origin master
