#!/bin/bash

show_help() {
  echo "Usage: $0 [options] [search_pattern]"
  echo
  echo "Options:"
  echo "  -h, --help       Show this help message and exit"
  echo "  -v, --verbose    Enable verbose mode"
  echo "  -t, --gettime    Log the time taken to perform the search"
  echo
  echo "Examples:"
  echo "  $0 -v 'file.*'           # Verbose search for files matching 'file.*' in current directory"
  echo "  $0 -t '*.txt'            # Search for files matching '*.txt' and log time taken"
  echo "  $0 -v -t 'file.c'        # Verbose search for 'file.c' and log time taken"
  echo
  echo "Note:"
  echo "  Only one search pattern can be provided at a time."
}

LOGFILE="script.log"
VERBOSE=false
GET_TIME=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      show_help
      exit 0
      ;;
    -v|--verbose)
      VERBOSE=true
      ;;
    -t|--gettime)
      GET_TIME=true
      ;;
    -*)
      echo "Error: Invalid option '$1'"
      show_help
      exit 1
      ;;
    *)
      if [ -z "$SEARCH_PATTERN" ]; then
        SEARCH_PATTERN="$1"
      else
        echo "Error: Multiple search patterns provided."
        show_help
        exit 1
      fi
      ;;
  esac
  shift
done

if [ -z "$SEARCH_PATTERN" ]; then
  echo "BASH : No search pattern provided."
  show_help
  exit 1
fi

echo "BASH : Start Script"
exec > >(tee -a "$LOGFILE") 2>&1

$VERBOSE && echo "BASH : Start Logging"
$VERBOSE && echo "BASH : Searching for pattern '$SEARCH_PATTERN'"

if $GET_TIME; then
  START_TIME=$(date +%s)
fi


tclsh search.tcl "$SEARCH_PATTERN" $VERBOSE

if $GET_TIME; then
  END_TIME=$(date +%s)
  TIME_TAKEN=$((END_TIME - START_TIME))
  echo "BASH : Total time taken: ${TIME_TAKEN} seconds"
fi

echo "BASH : End Bash main script"
