#!/bin/sh

if [ $# -eq 0 ]
  then
    echo "Add a commit message"
    return 1
fi

git add .
git commit -m "$1"
git push origin master

 
REACT_APP_SHEET_ID=1-uiLOn4LRpkb2Oovzg8JG2zafubfuLEtmpfYqjRcdJI npm run build
cp -a build/. production/
cd production
git add .
git commit -m "$1"
git push origin production
cd ..

# github pages

npm run build
cp -a build/. demo/
cd demo
git add .
git commit -m "$1"
git push origin gh-pages
cd ..