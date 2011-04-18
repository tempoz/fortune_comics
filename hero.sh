#!/bin/bash

#HERO
wget -q -U firefox -O ~/.fortune_comics/homepage invisiblecities.comicgenesis.com
len=`egrep -o "^.*<b>[0-9]* [A-Za-z]* [0-9]*:</b>.*$" ~/.fortune_comics/homepage | sed "s///g" | egrep -o "[0-9]*</a>$" | sed "s/<\\/a>//g"`

IFS='
'
quotes=( )
while [ ${#quotes[@]} == 0 ] ; do

  index=$(($RANDOM % $len))
  index=$(($index + 1))

  wget -q -U firefox -O ~/.fortune_comics/homepage invisiblecities.comicgenesis.com/$index.html
  quotes=(`egrep -o "^.*<a onMouseover.*$" ~/.fortune_comics/homepage | egrep -o "'.+'" | sed "s/', ''//g" | sed "s/'//g"`)
done

element=$(($RANDOM % ${#quotes[@]}))

quote=${quotes[ $element ]}

quote=`echo -e "$quote" | sed "s/<p>/\\n/g" | sed "s/<i>//g" | sed "s/<\\/i>//g"`
rm ~/.fortune_comics/homepage

who='HERO'

echo -e "$quote\n\t-$who"
