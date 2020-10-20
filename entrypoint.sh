#!/bin/bash

npm i minify -g
apt-get update
apt-get -y install moreutils

minify_file(){
    directory=$1
    basename=$(basename $directory);
    extension="${basename##*.}"
    output="";
    if [ -z "$INPUT_OUTPUT" ]
    then
        output="${directory%/*}/"
    else
        mkdir -p $INPUT_OUTPUT
        output="$INPUT_OUTPUT";
    fi
    filename="${basename%.*}"
    output_path="${output}${filename}.min.${extension}"
    rm ${output_path}
    minify ${directory} | sponge ${output_path}
    echo "minify ${directory} > ${output_path}"
}

if [ -z "$INPUT_DIRECTORY" ]
then
    find . -type f \( -iname \*.html -o -iname \*.js -o -iname \*.css \) | while read fname
        do
            if [[ "$fname" != *"min."* ]]; then
                minify_file $fname
            fi
        done
else
    minify_file $INPUT_DIRECTORY
fi
