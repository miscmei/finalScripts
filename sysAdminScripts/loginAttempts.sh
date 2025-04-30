#!/bin/bash

echo ""
echo "----------Welcome to the Failed Login Attempts Page----------"
echo ""

LOG_FILE="./sample_auth.log"

# checking if the log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file '$LOG_FILE' not found."
    exit 1
fi

echo "Checking for failed login attempts in $LOG_FILE..."
echo ""
echo "The failed login attempts are listed below: "

grep "Failed password" "$LOG_FILE" | tail -n 20

echo ""