#!/bin/bash
#Script to copy ssh pub key for all hosts

HOSTS_FILE="hosts"
SSH_PASS='Test123'


# if specific address has been provided ($1 == IP address)

if [[ -n "$1" ]]; then
  echo "provided IP address: $1"
  sshpass -p "$SSH_PASS" ssh-copy-id -i ~/.ssh/id_rsa.pub user@$1
else 
  # if specific IP was not provided loop through the file line by line from hosts file
  echo "No specific IP was provided. Perfoming reading from hosts file..."

  # Check if the file hosts exists
if [[ ! -f "$HOSTS_FILE" ]]; then
    echo "Error: File '$HOSTS_FILE' not found."
    exit 1
fi

  while IFS= read -r ip; do
    # Process each line here
    echo "IP: $ip"                                                     # output IP to console
    sshpass -p "$SSH_PASS" ssh-copy-id -i ~/.ssh/id_rsa.pub user@$ip   # copy ssh pub keys to remote hosts
done < "$HOSTS_FILE"

echo -e "Copying ssh pub keys to all hosts finished..."
fi


echo $?