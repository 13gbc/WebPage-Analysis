#!/bin/bash

# Regular expression to match domain names
regex='^([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6}$'

# Check if a valid domain name is passed as an argument
if [[ $1 =~ $regex ]]; then
    domain=$1
else
    echo "Invalid domain name"
    exit 1
fi

# Download the files and store the results in variables
security_txt=$(curl -s https://$domain/security.txt)
well_known_security_txt=$(curl -s https://$domain/.well-known/security.txt)

# Print the results with the URL title above it
echo "https://$domain/security.txt:"
echo "$security_txt"
echo ""
echo "https://$domain/.well-known/security.txt:"
echo "$well_known_security_txt"
