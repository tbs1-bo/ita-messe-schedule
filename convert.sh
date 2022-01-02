#!/bin/bash

# exit on error
set -e

# convert excel sheet with fahrplan into xml frab format.
# needs schedule_convert, which can be installed via pip install.

SLUG=ita

soffice --convert-to csv schedule-$SLUG.fods

# https://github.com/Zverik/schedule-convert
schedule_convert schedule-$SLUG.ini schedule-$SLUG.csv -o schedule-$SLUG.xml

# show finished xml doc nicely formatted
xmlstarlet format schedule-$SLUG.xml
