# ITA-Messe Schedule

Create a frab compatible [schedule](schedule-ita.xml) from an excel sheet.

Change the contents of the Excelsheet and 
[github action](https://github.com/tbs1-bo/ita-messe-schedule/actions) 
will do the rest.


## Info-Beamer

Columns in the spreadsheet template and how it affects presentation in info
beamer screens using the [scheduled player](https://info-beamer.com/package/26972/doc)
package.

* day,start,duration,title,abstract,speakers: used to show the next talk and time until it starts
* room: devices are assigned to rooms. This way only talks in the current room are shown.
* track: mark entries with different colors.

