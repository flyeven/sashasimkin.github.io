eval "$(ssh-agent -s)"
chmod 600 deploy_key
ssh-add deploy_key
mv _site/ "$TMPDIR/${TRAVIS_BUILD_ID}_built_site"
git checkout origin/master
rm -rf *
mv "$TMPDIR/${TRAVIS_BUILD_ID}_built_site/*" .
git config user.email "sashasimkin+travis@gmail.com"
git config user.name "Travis CI"
ls
# git add . --all
# git commit -m "Generated from build: $TRAVIS_BUILD_ID triggered by commit $TRAVIS_COMMIT"
# git config --global push.default simple
# git push

