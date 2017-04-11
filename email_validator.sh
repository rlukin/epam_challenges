#!/bin/bash

# #######################
# Email validation script
# #######################

# Description
# ------------------------------------------------------
# This script validate input string(s) for email address
# ------------------------------------------------------

# Usefull links
# -----------------------------------
# https://tools.ietf.org/html/rfc2822
# http://emailregex.com/
# https://habrahabr.ru/post/224623/
# http://rumkin.com/software/email/rules.php
# -----------------------------------

# Author
# -----------
# Roman Lukin
# -----------


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


regexp='\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b'

failed(){
	echo -e "\t\e[31;1mFail\e[0m"
}

passed(){
	echo -e "\t\e[32;1mOK\e[0m"
}
validate() {
  echo -e "Validating \e[32;1m$1\e[0m:\n"
  #check domain existence (RFC2822 section 2.2)
  echo -n "Domain check"
  if [[ $1 =~ ^.+@[^@]+$ ]]; then
	passed
  else 
	failed
  fi
  #check correctness for quotes (RFC 2822 section 3.4.1, 4.4)
  #check periods (RFC 2822 section 3.4.1)
  #check allowed symbols (RFC 2822 section 3.4.1)
  #brackets for domain (RFC 2822 section 3.4.1)
  #domain correctness (RFC 1035 2.3.4)
  #check allowed length (RFC 1035 section 2.3.4, RFC 2821 section 4.5.3.1)
  #check hyphens (RFC 1035, section 2.3.4)
  #check for a and mx records (RFC 2821, section 3.6)
  #

  if [[ $1 =~ $regexp ]]; then
	echo -e "\e[32;1m$1\e[0m seems valid"
  else
	echo -e "\e[31;1m$1\e[0m not valid"
  fi
  echo "--------------------------------------------------"
}

# Read the options
main(){
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
}

main $@
exit 0
