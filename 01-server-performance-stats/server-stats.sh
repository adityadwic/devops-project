#!/bin/bash
# server-stats.sh - Basic Server Performance Stats Analyzer
# Make sure to run: chmod +x server-stats.sh

echo "==============================================="
echo "         SERVER PERFORMANCE STATISTICS"
echo "==============================================="
echo

# OS version
echo ">> OS Version:"
cat /etc/*release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"'
echo

# Uptime
echo ">> Uptime:"
uptime -p
echo

# Load average
echo ">> Load Average:"
uptime | awk -F'load average:' '{ print $2 }'
echo

# Logged in users
echo ">> Logged in users:"
who | awk '{print $1}' | sort | uniq
echo

# CPU usage
echo ">> Total CPU Usage:"
mpstat 1 1 | awk '/Average/ && $2 ~ /all/ { printf "User: %.1f%%, System: %.1f%%, Idle: %.1f%%\n", $3, $5, $12 }'
echo

# Memory usage
echo ">> Memory Usage:"
free -h | awk 'NR==2{printf "Used: %s / Total: %s (%.2f%%)\n", $3,$2,$3*100/$2 }'
echo

# Disk usage
echo ">> Disk Usage:"
df -h --total | awk '/total/ {printf "Used: %s / Total: %s (%.2f%%)\n", $3,$2,$5 }'
echo

# Top 5 processes by CPU
echo ">> Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
echo

# Top 5 processes by Memory
echo ">> Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6
echo

# Failed login attempts (if log file exists)
if [ -f /var/log/auth.log ]; then
  echo ">> Failed Login Attempts:"
  grep "Failed password" /var/log/auth.log | wc -l
  echo
fi

echo "==============================================="
echo "        END OF REPORT"
echo "==============================================="
