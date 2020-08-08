#!/bin/bash
# ---------------------------------------------------------------------------------------------
# MIT License
#
# Copyright (c) 2020, Solace Corporation, Ricardo Gomez-Ulmke (ricardo.gomez-ulmke@solace.com)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# ---------------------------------------------------------------------------------------------

function showEnv() {
  echo > /dev/tty
  echo "# Project Environment:" > /dev/tty
  echo > /dev/tty
  env | grep AS_SAMPLES > /dev/tty
  echo > /dev/tty
  echo "# Ansible Environment:" > /dev/tty
  echo > /dev/tty
  env | grep ANSIBLE > /dev/tty
  echo > /dev/tty
  echo "# Docker Containers:" > /dev/tty
  echo > /dev/tty
  docker ps -a > /dev/tty
  echo > /dev/tty
  return 0
}

function wait4Key() {
  read -n 1 -p "Press key to continue, CTRL-C to exit ..." x
  echo > /dev/tty
  return 0
}

function assertFile() {
  if [[ $# -lt 1 ]]; then
      echo "Usage: fileVar='\$(assertFile {full-path/filename})'" 1>&2
      return 1
  fi
  local file=$1
  if [[ ! -f "$file" ]]; then
    echo ">>> ERR: file='$file' does not exist. aborting." > /dev/tty
    echo > /dev/tty
    return 1;
  fi
  echo $file
  return 0
}

return 0





function wait4BrokerStart() {
  echo "pausing: " > /dev/tty
  local -a marks=( '/' '-' '\' '|' );
  local counter=0
  while [ $counter -le 20 ]; do
   # echo -ne "${marks[i++ % ${#marks[@]}]}" > /dev/tty
   sleep 1s;
   #echo -ne "\b" > /dev/tty
   echo -n " $counter" > /dev/tty
   counter=$(( $counter + 1 ))
  done;
  echo  > /dev/tty;
  echo  > /dev/tty
}



###
# The End.
