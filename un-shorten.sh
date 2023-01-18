#!/bin/bash

# Usage: ./un-shorten.sh <short_url>

url=$1

if [[ ! $url =~ ^https ]]; then
  echo -e "\033[1;31mError: URL must start with 'https'\033[0m"
  exit 1
fi

long_url=$(curl -sI $url | grep -i location: | awk '{print $2}')

echo -e "\033[1;32m$long_url\033[0m"
