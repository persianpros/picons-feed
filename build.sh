#!/bin/sh

# Script by Persian Prince for https://github.com/OpenVisionE2
# You're not allowed to remove my copyright or reuse this script without putting this header.

rm -rf *.ipk
rm -rf *index*
rm -rf *Packages*

./fetch.sh https://github.com/picons/picons/releases

java -jar IPKFeedGenerator.jar

setup_git() {
  git config --global user.email "bot@openvision.tech"
  git config --global user.name "Open Vision picon bot"
}

commit_files() {
  git checkout master
  git add -u
  git add *
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add upstream https://${GH_TOKEN}@github.com/persianpros/picons-feed.git > /dev/null 2>&1
  git push --quiet upstream master || echo "failed to push with error $?"
}

setup_git
commit_files
upload_files
