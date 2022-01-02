#!/bin/bash -x

# exit on error
set -e

# convert excel sheet with fahrplan into xml frab format.
# needs schedule_convert, which can be installed via pip install.

SLUG=ita

libreoffice --convert-to csv $PWD/schedule-$SLUG.xlsx

# https://github.com/Zverik/schedule-convert
schedule_convert $PWD/schedule-$SLUG.ini $PWD/schedule-$SLUG.csv -o $PWD/schedule-$SLUG.xml

# show finished xml doc nicely formatted
xmlstarlet format schedule-$SLUG.xml
