#!/bin/bash

#A Softer World
wget -q -O ~/.fortune_comics/homepage www.asofterworld.com/
index=`egrep -o "[0-9]*\">*fnord" ~/.fortune_comics/homepage | egrep -o "[0-9]*"`
wget -q -O ~/.fortune_comics/homepage www.asofterworld.com/index.php?id=$index
quote=`egrep -o "title=\".*\" onClick" ~/.fortune_comics/homepage | sed "s/title=\"//g" | sed "s/\" onClick$//g"`

rm ~/.fortune_comics/homepage

who='a softer world'

echo -e "$quote\n\t-$who"
