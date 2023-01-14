#!/bin/bash

# Regular expression to match domain names
regex='^([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6}$'

while getopts ":i" opt; do
  case $opt in
    i)
      echo "security.txt is a file that provides contact information for security researchers who have discovered vulnerabilities on a website. The file is typically located at the root of the domain or at .well-known/security.txt. It is a standard proposed by the Internet Bug Bounty organization, which aims to make it easier for researchers to report vulnerabilities and for website owners to receive and respond to reports."
      exit 0
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

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

echo "https://$domain/security.txt:"
echo "$security_txt"
echo ""
echo "https://$domain/.well-known/security.txt:"
echo "$well_known_security_txt"

