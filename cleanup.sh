#!/bin/sh

find . -name '*.ipk' -type f | xargs rm -f
find . -name '*index*' -type f | xargs rm -f
find . -name '*Packages*' -type f | xargs rm -f

