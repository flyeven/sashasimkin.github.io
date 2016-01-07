eval "$(ssh-agent -s)"
chmod 600 deploy_key
ssh-add deploy_key
mv _site/ "$TMPDIR/${TRAVIS_BUILD_ID}_built_site"
ls -la "$TMPDIR/${TRAVIS_BUILD_ID}_built_site"
git fetch origin master:master
git checkout master
rm -rf *
ls -la
ls -la "$TMPDIR/${TRAVIS_BUILD_ID}_built_site"
mv $TMPDIR/${TRAVIS_BUILD_ID}_built_site/* $TRAVIS_BUILD_DIR
git config user.email "sashasimkin+travis@gmail.com"
git config user.name "Travis CI"
ls -la
# git add . --all
# git commit -m "Generated from build: $TRAVIS_BUILD_ID triggered by commit $TRAVIS_COMMIT"
# git config --global push.default simple
# git push origin master

