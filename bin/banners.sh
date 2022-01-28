for year in 1998 1999 2000 2001 2002 2003 2004 2005 2006 2009 2014 2015 2016 2017 2018 2019 2020 2021 2022
do
    convert docs/img/wswlogo_print.png  -gravity North -pointsize 16 -fill 'rgb(64,65,44)' -antialias -font AvantGarde-Book -annotate -48+25 "$year" docs/img/wswlogo_$year.png
done
