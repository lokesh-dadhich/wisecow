#!/bin/bash

# System Health Monitoring Script
# Thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=90
LOG_FILE="/var/log/system_health.log"

echo "===== $(date) =====" >> $LOG_FILE

# CPU Usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2 + $4)}')
if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    echo "ALERT: High CPU Usage: ${CPU_USAGE}%" | tee -a $LOG_FILE
fi

# Memory Usage
MEM_USAGE=$(free | grep Mem | awk '{print int($3/$2 * 100)}')
if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
    echo "ALERT: High Memory Usage: ${MEM_USAGE}%" | tee -a $LOG_FILE
fi

# Disk Usage
DISK_USAGE=$(df -h / | awk 'NR==2{print int($5)}')
if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    echo "ALERT: High Disk Usage: ${DISK_USAGE}%" | tee -a $LOG_FILE
fi

# Running Processes
RUNNING_PROC=$(ps -e --no-headers | wc -l)
echo "Running processes: $RUNNING_PROC" >> $LOG_FILE
