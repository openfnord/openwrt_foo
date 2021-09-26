#!/bin/sh

opkg update
# read file inst.txt line by line and install using opkg install
 
filename="inst.txt"
 
while IFS= read -r line
do
    # $line variable contains current line read from the file
    # display $line text on the screen or do something with it.
 
    opkg install "$line"
done < $filename
