#!/bin/sh

# Script by Persian Prince for https://github.com/OpenVisionE2
# You're not allowed to remove my copyright or reuse this script without putting this header.

commit_files() {
  git commit -m "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add upstream https://${GH_TOKEN}@github.com/OpenVisionE2/picons-feed.git > /dev/null 2>&1
  git push --quiet upstream master || echo "failed to push with error $?"
}

commit_files
upload_files
