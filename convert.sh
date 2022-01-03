#!/bin/bash

# exit on error
set -e

# convert excel sheet with fahrplan into xml frab format.
# needs schedule_convert, which can be installed via pip install.

SLUG=ita

# https://ask.libreoffice.org/t/how-to-convert-to-csv-with-utf-8-encoding-using-lo5-command-line/30711/4
# https://wiki.openoffice.org/wiki/Documentation/DevGuide/Spreadsheets/Filter_Options#Filter_Options_for_the_CSV_Filter
# need to specify encoding (UTF8) to avoid problems with german umlauts.
#
soffice --convert-to csv:"Text - txt - csv (StarCalc)":44,34,76 schedule-$SLUG.fods

# https://github.com/Zverik/schedule-convert
# -z +1 for specifying timezone. Needed for info beamer to be
#       regonized.
#
# +1: ab 31.10
# +2: ab 27.3.
# https://www.zeitverschiebung.net/de/timezone/europe--berlin
#
schedule_convert -z +1 schedule-$SLUG.ini schedule-$SLUG.csv -o schedule-$SLUG.xml

# show finished xml doc nicely formatted
xmlstarlet format schedule-$SLUG.xml
