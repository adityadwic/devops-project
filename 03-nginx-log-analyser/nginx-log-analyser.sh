#!/bin/bash
# nginx-log-analyser.sh - Analyze Nginx access logs
# Usage: ./nginx-log-analyser.sh <access.log>

if [ $# -eq 0 ]; then
  echo "Usage: $0 <nginx-access-log>"
  exit 1
fi

LOG_FILE=$1

if [ ! -f "$LOG_FILE" ]; then
  echo "Error: Log file '$LOG_FILE' not found!"
  exit 1
fi

echo "==============================================="
echo "        NGINX LOG ANALYSIS REPORT"
echo "==============================================="
echo

# Top 5 IP addresses
echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'
echo

# Top 5 requested paths
echo "Top 5 most requested paths:"
awk -F\" '{print $2}' "$LOG_FILE" | awk '{print $2}' | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'
echo

# Top 5 response status codes
echo "Top 5 response status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'
echo

# Top 5 user agents
echo "Top 5 user agents:"
awk -F\" '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | sed 's/^ *//'
echo

echo "==============================================="
echo "              END OF REPORT"
echo "==============================================="
