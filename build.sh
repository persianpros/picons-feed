#!/bin/sh

# Script by Persian Prince for https://github.com/OpenVisionE2
# You're not allowed to remove my copyright or reuse this script without putting this header.

find . -name '*.ipk' -type f | xargs rm -f
find . -name '*index*' -type f | xargs rm -f
find . -name '*Packages*' -type f | xargs rm -f

wget -c -nH -r -q -l0 -A ipk -P ./feed -np -nd --wait=3 --execute="robots = off" https://openpicons.com/picons/?dir=full-motor-snp

# We may can't upload enigma2-plugin-picons-snp-full.800x450-760x410.light.on.transparent because of github's 100MB limit per file
find . -name '*.ipk' -size +98M | xargs rm -f

wget -c -nH -r -q -l0 -A ipk -P ./feed -np -nd --wait=3 --execute="robots = off" https://openpicons.com/picons/?dir=full-motor-srp

# We may can't upload enigma2-plugin-picons-srp-full.800x450-760x410.light.on.transparent because of github's 100MB limit per file
find . -name '*.ipk' -size +98M | xargs rm -f

cd feed
java -jar IPKFeedGenerator.jar
cd ..

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
  git remote add upstream https://${GH_TOKEN}@github.com/OpenVisionE2/picons-feed.git > /dev/null 2>&1
  git push --quiet upstream master || echo "failed to push with error $?"
}

setup_git
commit_files
upload_files
