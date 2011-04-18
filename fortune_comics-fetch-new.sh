#!/bin/bash

count=`ps aux | grep /bin/bash\ /home/.*/fortune_comics-fetch-new.sh$ | wc -l`
if [ $count -gt 2 ] ; then
  exit
fi

scripts=($(ls ~/.fortune_comics/scripts/ | egrep ".*\.sh$" | sort -R))

if [ -z $scripts ] ; then
  echo "No comics found. I guess you're a pretty boring person, huh?"
  exit
fi

script=${scripts[0]}

quote=""
while [ -z "$quote" ] ; do
  quote=`~/.fortune_comics/scripts/$script`
done

echo -e "$quote" > ~/.fortune_comics/quote
