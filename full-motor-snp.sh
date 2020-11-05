#!/bin/sh

./fetch-ipk.sh https://openpicons.com/picons/?dir=full-motor-snp

# We may can't upload enigma2-plugin-picons-snp-full.800x450-760x410.light.on.transparent because of github's 100MB limit per file
find . -name '*.ipk' -size +98M | xargs rm -f

