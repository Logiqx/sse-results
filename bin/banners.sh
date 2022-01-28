for year in 1998 1999 2000 2001 2002 2003 2004 2005 2006 2009 2014 2015 2016 2017 2018 2019 2020 2021 2022
do
    convert docs/img/wswlogo_print.png  -gravity North -pointsize 14 -fill 'rgb(64,65,44)' -antialias -font "docs/fonts/Arkitech Medium.ttf" -annotate -49+27 "$year" docs/img/wswlogo_$year.png
done

convert docs/img/wswlogo_print.png  -gravity North -pointsize 12 -fill 'rgb(64,65,44)' -antialias -font "docs/fonts/Arkitech Bold.ttf" -annotate -49+18 "HISTORY" -pointsize 8 -annotate -49+30 "1998 - 2021" docs/img/wswlogo_all.png
