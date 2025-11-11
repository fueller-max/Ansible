#!/bin/bash
#Script to copy ssh pub key for all hosts

echo -e "Starting copying ssh pub keys to all hosts...\n"

HOSTS_FILE="hosts"
SSH_PASS='Test123'

# Check if the file hosts exists
if [[ ! -f "$HOSTS_FILE" ]]; then
    echo "Error: File '$HOSTS_FILE' not found."
    exit 1
fi

# Loop through the file line by line
while IFS= read -r ip; do
    # Process each line here
    echo "IP: $ip"                                                     # output IP to console
    sshpass -p "$SSH_PASS" ssh-copy-id -i ~/.ssh/id_rsa.pub user@$ip   # copy ssh pub keys to remote hosts
done < "$HOSTS_FILE"

echo -e "Copying ssh pub keys to all hosts finished..."

echo $?