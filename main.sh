#!/bin/bash

echo "BASH : Start Script"
if [ $# -lt 1 ]; then
  echo "BASH : there is no args..."
  exit 1
fi


LOGFILE="script.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "BASH : Start Logging"

tclsh tcl_search.tcl "$@"

echo "BASH : End Bash main script "

