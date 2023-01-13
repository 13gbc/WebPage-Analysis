#!/bin/bash

# Check if website URL is provided as a command-line parameter
if [ -z "$1" ]; then
    echo "Please provide a website URL as a command-line parameter"
    exit 1
fi

# Get website URL from command-line option
url=$1

# Use curl to download the website HTML
html=$(curl -L -s $url)

# Use grep to search for HTTP links
links=$(echo $html | grep -o 'http[^"]*')

# Use grep to extract domain name from links
domains=$(echo "$links" | grep -oP '(?<=//)[^/]+' | sort | uniq)

# Use grep to search for email addresses
emails=$(echo $html | grep -o '[A-Za-z0-9._%+-]\+@[A-Za-z0-9.-]\+\.[A-Z|a-z]\{2,\}' | sort | uniq)

# Print the results
echo "Links:"
echo "$domains"
echo ""
echo "Email addresses:"
echo "$emails"
