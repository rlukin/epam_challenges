#!/bin/bash

# #######################
# Email validation script
# #######################

# Description
# ---------------------------------------------------
# This script validate input string(s) for email address
# ---------------------------------------------------

# Usefull links
# -----------------------------------
# https://tools.ietf.org/html/rfc2822
# http://emailregex.com/
# https://habrahabr.ru/post/224623/
# -----------------------------------


# Print usage
usage() {
 echo -n "  Usage:
 $0 [OPTION] [STRINGS]

 Description:
 Verify strings as valid email format

 Options:
  -h, --help        Display this help and exit
 
 Example:
 $1 ./email_validator.sh kenny@pepper.ru 1@shut.org 1.1.1.
" 
  exit 1
}


#regexp='(?:[a-z0-9!#$%&'
#regexp+="'"
#regexp+='*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'
#regexp+="'"
#regexp+='*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])'

regexp='\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b'

validate() {
if [[ $1 =~ $regexp ]]; then
  echo -e "\e[32;1m$1\e[0m seems valid"
else
  echo -e "\e[31;1m$1\e[0m not valid"
fi
}

# Read the options
if [[ $# -eq 0 ]]; then
  usage
elif [[ $1 =~ -h|--help ]]; then
  usage >&2
else
  while (( "$#" )); do
  validate "$1"
  shift
  done
fi

exit 0
