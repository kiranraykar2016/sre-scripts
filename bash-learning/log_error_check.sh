#!/bin/bash


# printing a time

log_msg() {
	if [ -f "$path" ]; then
		echo "$( date '+%Y-%m-%d %H:%M:%S') [INFO] $1"
	else
		echo "$( date '+%Y-%m-%d %H:%M:%S') [ERROR] $1"
	fi

	
}


#checking the file

check_file(){
	path=$1
	if [ -f "$path" ]; then
		Total_errors=$(grep -c "ERROR" "$path")
		log_msg "$path has $Total_errors errors"
	else
		log_msg "$path: No file found"
	fi

}

while read -r line; do
	check_file "$line"

done < files.txt
