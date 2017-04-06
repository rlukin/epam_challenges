#!/bin/bash

# #######################
# Email validation script
# #######################

# Description
# ---------------------------------------------------
# This script validate input string for email address
# ---------------------------------------------------

# Usefull links
# -----------------------------------
# https://tools.ietf.org/html/rfc2822
# http://emailregex.com/
# https://habrahabr.ru/post/224623/
# -----------------------------------


# Print usage
usage() {
  echo -n "$0 [OPTION] [STRING]

 Verify string as valid email format

 Options:
  -h, --help        Display this help and exit"
  echo
  exit 1
}

regexp='(?:[a-z0-9!#$%&'
regexp+="'"
regexp+='*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'
regexp+="'"
regexp+='*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])'


echo $regexp

validate() {
echo "$1"
if [[ $1 =~ $regexp ]]; then
  echo -e "\e[32m$1"
  echo "seems valid"
fi
}

# Read the options
if [[ $# -eq 0 ]]; then
  usage
elif [[ $# -eq 1 ]]; then
  case "$1" in
    -h|--help) usage >&2;;
    *) validate "$1";;
  esac
fi
