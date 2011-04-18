#!/bin/sh

if ! [ -s ~/.fortune_comics/quote ] ; then
  ~/.fortune_comics/fortune_comics-fetch-new.sh
fi
cat ~/.fortune_comics/quote

~/.fortune_comics/fortune_comics-fetch-new.sh &
