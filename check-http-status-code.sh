#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <status code>"
    exit 1
fi

status_code=$1

if ! [[ "$status_code" =~ ^[0-9]{3}$ ]]; then
    echo "Invalid status code"
    exit 1
fi

case $status_code in
    100) echo "Continue";;
    101) echo "Switching Protocols";;
    200) echo "OK";;
    201) echo "Created";;
    202) echo "Accepted";;
    203) echo "Non-Authoritative Information";;
    204) echo "No Content";;
    205) echo "Reset Content";;
    206) echo "Partial Content";;
    300) echo "Multiple Choices";;
    301) echo "Moved Permanently";;
    302) echo "Found";;
    303) echo "See Other";;
    304) echo "Not Modified";;
    305) echo "Use Proxy";;
    307) echo "Temporary Redirect";;
    400) echo "Bad Request";;
    401) echo "Unauthorized";;
    402) echo "Payment Required";;
    403) echo "Forbidden";;
    404) echo "Not Found";;
    405) echo "Method Not Allowed";;
    406) echo "Not Acceptable";;
    407) echo "Proxy Authentication Required";;
    408) echo "Request Timeout";;
    409) echo "Conflict";;
    410) echo "Gone";;
    411) echo "Length Required";;
    412) echo "Precondition Failed";;
    413) echo "Request Entity Too Large";;
    414) echo "Request-URI Too Long";;
    415) echo "Unsupported Media Type";;
    416) echo "Requested Range Not Satisfiable";;
    417) echo "Expectation Failed";;
    500) echo "Internal Server Error";;
    501) echo "Not Implemented";;
    502) echo "Bad Gateway";;
    503) echo "Service Unavailable";;
    504) echo "Gateway Timeout";;
    505) echo "HTTP Version Not Supported";;
    *) echo "Invalid status code";;
esac

if [ "$status_code" -ge 200 -a "$status_code" -lt 300 ]; then
    echo "This is 2xx status"
elif [ "$status_code" -ge 300 -a "$status_code" -lt 400 ]; then
    echo "This is 3xx status"
elif [ "$status_code" -ge 400 -a "$status_code" -lt 500 ]; then
    echo "This is 4xx status"
elif [ "$status_code" -ge 500 -a "$status_code" -lt 600 ]; then
    echo "This is 5xx status"
fi
