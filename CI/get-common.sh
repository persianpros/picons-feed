#!/bin/sh

cd feed
find . -name '*.ipk' -type f | xargs rm -f
find . -name '*Packages*' -type f | xargs rm -f

wget -c -nH -r -q -l0 -A ipk -np -nd --wait=3 --execute="robots = off" https://openpicons.com/picons/?dir=full-motor-snp
wget -c -nH -r -q -l0 -A ipk -np -nd --wait=3 --execute="robots = off" https://openpicons.com/picons/?dir=full-motor-srp

rename 'y/A-Z/a-z/' *.ipk

find . -name '*.ipk' -size +98M | xargs rm -f
chmod 755 IPKFeedGenerator.jar
java -jar IPKFeedGenerator.jar
cd ..
git checkout master
git add -u
git add *
git commit -m "Fetch latest picon files."
