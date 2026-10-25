#!/bin/bash


echo "========Log anaysis report========"
echo "$(date)"
echo ""

echo "====errors per hour====="
grep "ERROR" test.log | awk '{print $2}' |  cut -d: -f1 | sort | uniq -c


echo "==Total errors=="
grep "ERROR" test.log | wc -l



