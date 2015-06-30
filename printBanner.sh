#!/usr/bin/env bash

### Prints the given text to the output/console with inverted colors options and vertical space control
# Author: Thales Pinheiro
# Since: 06/2015
# Basic usage:
#  sh printBanner -t "Hello World"
#  ./printBanner -t "Hello World"
#  printBanner -t "Helo World" included the source into your program by source printBanner.sh
#  printBanner -t "Helo World" included the source into your .bash_profile or .bashrc
#
# Copyright (c) 2015
#  Thales Pinheiro. All rights reserved.
#
# Copyright terms:
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 3. All advertising materials mentioning features or use of this software
#    must display the following acknowledgement:
#  This product includes software developed by Thales Pinheiro
# 4. The names of the author cannot be used to endorse or promote products
#    derived from this software without specific prior written permission.
# THIS SOFTWARE IS PROVIDED "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.


### Helper functions

# Clear the environment, good practice
clearEnvironment () {
  unset printToConsole;
  unset printErrorToConsole;
  unset USAGE;
  unset isTextEmpty;
  unset clearEnvironment;
}

# Print to console with inverted colors option
#   It checks the PRINTBANNERCC variable, and if it's set,
#   print without the inverted color
# * param1: the text
printToConsole () {
  if [[ "$PRINTBANNERCC" == "NIC" ]]; then
    echo "$1";
  else
    tput rev;
    echo "$1";
    tput sgr0;
  fi
}

# Print some error to console, also echoing the usage,
#   cleaning the environment and exiting the function
#   without exit the terminal
# * param1: the text
printErrorToConsole () {
  printToConsole "$1";
  echo;
  echo "$USAGE";
  clearEnvironment;
  kill -INT $$;
}

# Check if some text is empty
# * param1: the text to be checked
# * param2: the text to be printed
isTextEmpty () {
  if [ -z "$1" ]; then
    printErrorToConsole "$2";
  fi
}

### Script start here

# Holds the helper/usage text
USAGE="Usage: printBanner [TEXT] or printBanner [OPTION] [TEXT]
Prints [TEXT] to the terminal with inverted colors.

Available options:

-t, --top                  add top vertical space
-b, --bottom               add bottom vertical space
-tb, --top-bottom          add top and bottom vertical space
-nvs|--no-vertical-space   print the text without any vertical space
-h, --help                 display this help and exit

Examples:

printBanner -t \"Hello World\"
printBanner --top-bottom \"Hello World\"

PS:

- Double quotes your text!
- By default, it's add both top and bottom vertical space,
  if you don't want this behaviour, use the -nvs options or
  export PRINTBANNERVSC variable with NVS value.
  E.g.: export PRINTBANNERVSC=NVS
- By default, it's invert the terminal color,
  if you don't want this behaviour, export PRINTBANNERCC variable with NIC value.
  E.g.: export PRINTBANNERCC=NIC

Notes:

- VSC means Vertical Space Control and NVS means No Vertical Space.
- CC means Color Control and NIC means No Inverted Color.";

# Validate the first parameter - it should be an option or a string
isTextEmpty "$1" "Error: Are you forgeting some option or the text?";

# Checks the environment variable presence, if yes, just print with no vertical space
if [[ "$PRINTBANNERVSC" == "NVS" ]]; then
  printToConsole "$1";
elif [[ "$1" != "-"* && "$1" != "--"* ]]; then # Without any option, just print with both vertical space
  echo;
  printToConsole "$1";
  echo;
else
  # Checks if the text is empty with the exception of the --test option
  if [[ "$1" != "--test" ]]; then
    isTextEmpty "$2" "Error: Are you forgeting the text?";
  fi

  # With option, print by case
  case "$1" in
    -t|--top)
      echo;
      printToConsole "$2";
      ;;
    -b|--bottom)
      printToConsole "$2";
      echo;
      ;;
    -tb|--top-bottom)
      echo;
      printToConsole "$2";
      echo;
      ;;
    -nvs|--no-vertical-space)
      printToConsole "$2";
      ;;
    -h|--help)
      echo "$USAGE";
      ;;
    *)
      printErrorToConsole "Error: Invalid option $1";
      echo ;
      echo "$USAGE";
      ;;
  esac
fi

# Clear the environment
clearEnvironment;
