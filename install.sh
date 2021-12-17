#!/bin/bash
DIR="$HOME/.config/inkscape/templates" 
FILE="$DIR/default.svg" 

if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR" 
fi

if [ ! -f $FILE ]; then
    cp "./figures/default.svg" "$FILE"
fi
