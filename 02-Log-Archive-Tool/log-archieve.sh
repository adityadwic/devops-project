#!/bin/bash
# log-archive.sh - Archive logs with timestamp
# Usage: ./log-archive.sh <log-directory>

# Exit if no argument is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <log-directory>"
  exit 1
fi

LOG_DIR=$1

# Check if log directory exists
if [ ! -d "$LOG_DIR" ]; then
  echo "Error: Directory $LOG_DIR does not exist."
  exit 1
fi

# Create archive directory
ARCHIVE_DIR="$HOME/log_archives"
mkdir -p "$ARCHIVE_DIR"

# Create timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Archive file name
ARCHIVE_FILE="logs_archive_${TIMESTAMP}.tar.gz"

# Create tar.gz archive
tar -czf "$ARCHIVE_DIR/$ARCHIVE_FILE" -C "$LOG_DIR" .

# Log the archive action
echo "$(date +"%Y-%m-%d %H:%M:%S") - Archived $LOG_DIR to $ARCHIVE_DIR/$ARCHIVE_FILE" >> "$ARCHIVE_DIR/archive.log"

echo "✅ Logs from $LOG_DIR archived to $ARCHIVE_DIR/$ARCHIVE_FILE"
