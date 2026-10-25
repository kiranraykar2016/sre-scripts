#!/bin/bash


usage=$(df -h / | awk 'NR==2{print $5}' | cut -d% -f1)


if [ $usage -gt 90 ]; then
	echo "CRITICAL: CURRENT DISK USAGE IS $usage"
elif [ $usage -gt 80 ]; then
	echo "WARNING: CURRENT DISK USAGE IS $usage"
else
	echo "NORMAL: CURRENT DISK USAGE IS $usage"
fi
