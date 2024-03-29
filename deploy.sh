#!/bin/bash
set -ex
eval "$(ssh-agent -s)"
chmod 600 deploy_key
ssh-add deploy_key
mv _site/ "$TMPDIR/${TRAVIS_BUILD_ID}_built_site"
git fetch origin master:master
git checkout master
rm -rf *
mv $TMPDIR/${TRAVIS_BUILD_ID}_built_site/* $TRAVIS_BUILD_DIR
git config user.email "sashasimkin+travis@gmail.com"
git config user.name "Travis CI"
git add . --all
git commit -m "Generated from build: $TRAVIS_BUILD_ID triggered by commit $TRAVIS_COMMIT"
git config --global push.default simple
git show
git remote set-url origin "git@github.com:$TRAVIS_REPO_SLUG.git"
git push origin master
