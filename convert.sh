#!/bin/bash -x

# exit on error
set -e

# convert excel sheet with fahrplan into xml frab format.
# needs schedule_convert, which can be installed via pip install.

SLUG=ita

libreoffice --convert-to csv schedule-$SLUG.xlsx

echo "ls"
ls -al
echo "pwd"
pwd


# https://github.com/Zverik/schedule-convert
schedule_convert schedule-$SLUG.ini schedule-$SLUG.csv -o schedule-$SLUG.xml

# show finished xml doc nicely formatted
xmlstarlet format schedule-$SLUG.xml
