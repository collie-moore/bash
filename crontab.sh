#!/bin/bash

# Define log file path
LOG_FILE="/home/ubuntu/minute_log.txt"

# Ensure log directory exists
mkdir -p "$(dirname "$LOG_FILE")"

# Append timestamp to log file
echo "Script ran at: $(date)" >> "$LOG_FILE"

# Update dependencies
sudo apt-get update
echo "Dependencies updated at: $(date)" >> "$LOG_FILE"

# Install nginx
sudo apt-get install -y nginx
echo "Nginx installed at: $(date)" >> "$LOG_FILE"

# Start nginx service
sudo systemctl start nginx
echo "Nginx service started at: $(date)" >> "$LOG_FILE"

# Enable nginx to start on boot
sudo systemctl enable nginx
echo "Nginx enabled to start on boot at: $(date)" >> "$LOG_FILE"

# Run the script every minute
# Add the following line to crontab
# * * * * * /path/to/this/script.sh