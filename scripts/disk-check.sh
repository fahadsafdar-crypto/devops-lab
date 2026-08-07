#!/bin/bash

echo "=== Disk Check ==="

df -h /
echo ""
echo "=== Top 5 Biggest Items in /var/log (if permitted) ==="
du -sh /var/log/* 2>/dev/null | sort -hr | head -5
echo ""
if [ $? -eq 0 ]; then
  echo "Disk Check finished"
  exit 0
else
  echo "Disk Check had an issue"
  exit 1
fi
 
