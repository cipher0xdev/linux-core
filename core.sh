#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "the script must be run as root"
   exit 1
fi
