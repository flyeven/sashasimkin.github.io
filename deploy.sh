eval "$(ssh-agent -s)"
chmod 600 deploy_key
ssh-add deploy_key
mv _site/ "$TMPDIR/${TRAVIS_BUILD_ID}_built_site"
git checkout master
rm -rf *
mv "$TMPDIR/${TRAVIS_BUILD_ID}_built_site/*" .
git add .
git commit -m "Generated from build: $TRAVIS_BUILD_ID triggered by commit $TRAVIS_COMMIT"
git push

