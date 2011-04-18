#!/bin/bash

#XKCD
wget -q -O ~/.fortune_comics/homepage dynamic.xkcd.com/random/comic/
quote=`egrep -o "comics/.*?\" title=\"[^\"]*" ~/.fortune_comics/homepage | sed "s/^.*\"//g" | sed "s/&#39;/'/g"`

rm ~/.fortune_comics/homepage

who='XKCD'

echo -e "$quote\n\t-$who"
