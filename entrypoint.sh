#!/bin/sh -l

npm i minify@11.0.1 -g
apt-get update
apt-get -y install moreutils

find . -type f \( -iname \*.html -o -iname \*.js -o -iname \*.css \) | while read fname
    do
    minify ${fname} | sponge ${fname}
    done
