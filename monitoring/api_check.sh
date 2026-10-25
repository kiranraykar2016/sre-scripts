#!/bin/bash

URL="https://jsonplaceholder.typicode.com/posts/1"


echo "=====API HEALTH CHECKUP====="
echo "Time: $(date)"
echo ""


STATUS=$(curl -o /dev/null -s -w "%{http_code}" $URL)

if [ $STATUS -eq 200 ]; then
	echo "API is up and current status: $STATUS"
elif [ $STATUS -eq 404 ]; then
        echo "API not found  and current status: $STATUS"
elif [ $STATUS -eq 500 ]; then
	echo "INTERNAL SERVER ERROR and current status: $STATUS"
elif [ $STATUS -eq 000 ]; then
	echo "connection not found and current status: $STATUS"
fi
