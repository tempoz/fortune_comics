#!/bin/bash

#XKCD
wget -q -O ~/.fortune_comics/homepage http://xkcd.com/info.0.json
num=`egrep -o "\"num\": [0-9]*" ~/.fortune_comics/homepage | egrep -o "[0-9]*"`
num=$(($RANDOM % $num))
num=$(($num + 1))
wget -q -O ~/.fortune_comics/homepage http://xkcd.com/$num/info.0.json
quote=`egrep -o "\"alt\": \".*?\", \"day\"" ~/.fortune_comics/homepage | sed "s/^\"alt\": \"//g" | sed "s/\", \"day\"$//g" | sed "s/\\\\\\\\\"/\"/g" | sed "s/\\\\\\\\\\\\\\\\/\\\\\\\\/g"`
rm ~/.fortune_comics/homepage
who='XKCD'
echo -e "$quote\n\t-$who"
