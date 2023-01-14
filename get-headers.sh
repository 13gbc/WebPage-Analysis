#!/bin/bash

# This script gets the HTTP headers of a website

# Check if the user provided a website URL
if [ -z "$1" ]; then
  echo "Error: Please provide a website URL"
  exit 1
fi

# Store the website URL in a variable
url=$1

# Use the 'curl' command to get the HTTP headers
# and store the output in a variable called 'headers'
headers=$(curl -I $url)

# Print the HTTP headers
echo "$headers"
