#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <local_file_path> "
    exit 1
fi

LOCAL_FILE="$1"
REMOTE_USER="root"
REMOTE_HOST="192.168.108.129"
REMOTE_DESTINATION="/etc/netplan/"

# Check if the local file exists
if [ ! -f "$LOCAL_FILE" ]; then
    echo "Error: Netplan file '$LOCAL_FILE' not found."
    exit 1
fi

# Execute the scp command
echo "Copying '$LOCAL_FILE' to '$REMOTE_USER@$REMOTE_HOST:$REMOTE_DESTINATION'..."
scp "$LOCAL_FILE" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DESTINATION"

# Check the exit status of the scp command
if [ $? -eq 0 ]; then
    echo "File copied successfully."
else
    echo "File copy failed."
fi