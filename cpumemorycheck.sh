#!/bin/bash


cpu_threshould=80
memory_threshuold=80

cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d"." -f1)

memory=$(free | awk 'NR==2 {printf "%.0f", $3*100/$2}')

echo "CPU USAGE: $cpu"
echo "Memory usage: $memory"

if [ "$cpu" -gt "$cpu_threshould" ]; then
	echo "Alert: CPU usage exceeded the Threshould: $cpu%>$cpu_threshould%"
else
	echo "CPU usage within limit: current usage $cpu%"
fi

if [ "$memory" -gt "$memory_threshuold" ]; then
	echo "ALERT: Memory usage exceeded the Threshould: $memory%>$memory_threshuold"
else
	echo "Memory usage within Threshould, current usage $memory"
fi


	


