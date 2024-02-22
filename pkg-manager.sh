#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "the script must be run as root"
   exit 1
fi

# exemple of use: dpkg_chk "libsqlite3-dev"
dpkg_chk() {
  dpkg -s $1 >/dev/null 2>&1 && installed=true || installed=false 

  if [ "$installed" == false ]; then
    echo "installing $1..."
    apt update > /dev/null 2>&1 
    apt install $1 > /dev/null 2>&1 
  else 
    echo "$1 installed sucessful"
  fi
}
