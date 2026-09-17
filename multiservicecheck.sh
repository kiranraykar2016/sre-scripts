#!/bin/bash


services=("whatsapp" "RCS" "ngnix")

for service in "${services[@]}"; do
	if systemctl is-active --quiet "$services"; then
		echo "$service is up"
	else
		echo "$service is down"
	fi
done
