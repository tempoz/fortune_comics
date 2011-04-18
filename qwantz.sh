#!/bin/bash

#Dinosaur Comics
wget -q -O ~/.fortune_comics/homepage www.qwantz.com/index.php
quote=`egrep -o "comic=[0-9]*[^<]*</a></td></tr>" ~/.fortune_comics/homepage | sed "s/^[^>]*>//g" | sed "s/<\\/a><\\/td><\\/tr>$//g"`

rm ~/.fortune_comics/homepage

who='T-REX'

echo -e "$quote\n\t-$who"
