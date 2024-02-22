#!/bin/bash

request_root() {
   if [[ $EUID -ne 0 ]]; then
      echo "the script must be run as root"
   fi
}

require_root() {
   if [[ $EUID -ne 0 ]]; then
      echo "the script must be run as root"
      exit 1
   fi
}
