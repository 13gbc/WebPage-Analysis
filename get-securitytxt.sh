#!/bin/bash

website=$1
if ! [[ $website == *"https://"* ]]; then
  website="https://${website}"
fi

if curl --output /dev/null --silent --head --fail "${website}/security.txt"; then
  echo "Displaying ${website}/security.txt"
  curl "${website}/security.txt"
elif curl --output /dev/null --silent --head --fail "${website}/.well-known/security.txt"; then
  echo "Displaying ${website}/.well-known/security.txt"
  curl "${website}/.well-known/security.txt"
else
  echo "security.txt file not found on website"
fi
