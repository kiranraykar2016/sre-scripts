#!/bin/bash



DIR=${1:-.}
DAYS=${2:-7}
MODE=${3:-dry}


echo "Mode=$MODE | Folder=$DIR | Older than: $DAYS days"

if [ "$MODE" = "delete" ]; then
	find "$DIR" -name "*.log" -mtime +"$DAYS" -delete
	echo "File Deleted"
else
	find "$DIR" -name "*.log" -mtime +"$DAYS"
	echo "DRY RUN ONLY: File not deleted"
fi


