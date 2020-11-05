#!/bin/sh

function get-url-item {
    echo $1 | awk -F/ '{ print $'$2' }'
}

cut=0
url=$1

# count what our --cut-dir should be, this is nasty to the max
while [[ -n `get-url-item $url $[ $cut + 4 ]` ]]; do
    cut=$[ $cut + 1 ]
done

#[[ $url =~ http://.+..+..+/(.+) ]]
#[[ $BASH_REMATCH[1] =~ ]]

wget -c -nH -r -q -l0 -A ipk -P ./feed -np -nd --wait=3 --execute="robots = off" --cut-dir=$cut $url/

