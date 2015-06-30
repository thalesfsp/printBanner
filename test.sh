#!/usr/bin/env bash

### Prints the given text to the output/console with inverted colors options and vertical space control
# Author: Thales Pinheiro
# Since: 06/2015
# Usage:
# sh test.sh or ./test.sh
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

### Variables
TESTSTRING="Nice! The colors are inverted? I hope so, yeah?! 2>1<3 and 4/2+1-3=0, also [{key:value}, {key:value}] is an array of objects.";

### Script starts here

echo "It should print an inverted text with numbers and symbols with no vertical space (by setting PRINTBANNERVSC to NVS):";
export PRINTBANNERVSC="NVS";
./printBanner.sh "$TESTSTRING";
unset PRINTBANNERVSC;

echo "It should print an inverted text with numbers and symbols and both vertical space (without an option):";
./printBanner.sh "$TESTSTRING";

echo "It should print an inverted text with numbers and symbols and just top vertical space (with -t option):";
./printBanner.sh -t "$TESTSTRING";

echo "It should print an inverted text with numbers and symbols and just bottom vertical space (with -b option):";
./printBanner.sh -b "$TESTSTRING";

echo "It should print an inverted text with numbers and symbols with no vertical space (with -nvs option):";
./printBanner.sh -nvs "$TESTSTRING";

# Clear the environment, good practice
unset TESTSTRING;
unset testPrintBanner;
