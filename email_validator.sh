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
exit 1
}

validate() {
echo "$1"
if [[$1 ~= 'regexp']]
  then
  echo "$1 seems valid"
fi
}

# Read the options
if [[$# = 0]]
then
  usage
elif [[$# = 1]]
  then
  case "$1" in
    -h|--help) usage >&2;;
    *) validate;;
  esac
fi
