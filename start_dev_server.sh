#!/bin/bash

# start a development and test server to test the xml frab file
# in an info beamer environment.

PORT=8004
LOGFILE=$0.log


echo "start http server on port $PORT"
echo "logging to $LOGFILE"
python3 -m http.server "$PORT" >> "$LOGFILE" 2>&1 &
P1="$!"

ngrok http "$PORT"

kill "$P1"
