#!/bin/bash

logfile="practice.log"
threshould=2

echo "====Whatsapp delivery failure report===="
echo "checking logs: $logfile"
echo "Time: $(date)"

total=$( wc -l < $logfile )
ERROR=$( grep -c "ERROR" $logfile )
WARNING=$( grep -c "WARNING" $logfile )
INFO=$( grep -c "INFO" $logfile )

echo "Total: $total"
echo "Error: $ERROR"
echo "WARNING: $WARNING"
echo "INFO: $INFO"

if [ "$ERROR" -gt "$threshould" ]; then
	echo "The error ($ERROR) exceeded the provided threshould $threshould"
	echo " "
	echo "Failed deliveries:"
	grep  "ERROR" $logfile | awk '{print  " Time:" $2, "| Number: " $(NF-1)}'

else
	echo "The error ($ERROR) is within the provided threshould $threshould"
fi
