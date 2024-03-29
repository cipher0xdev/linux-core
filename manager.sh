#!/bin/bash

# usage: dpkg_check "libname"
dpkg_check() {
  dpkg -s $1 >/dev/null 2>&1 && installed=true || installed=false 

  if [ "$installed" == false ]; then
    apt update > /dev/null 2>&1 
    apt install $1 > /dev/null 2>&1 
  fi
}

# automatic compilation and configuration from a clone of a repository
# usage: git_install "https://github.com/username/name.git" "name"
git_install() {
  if ! git --version > /dev/null 2>&1; then
    apt update > /dev/null 2>&1 
    apt install git -y > /dev/null 2>&1 
  fi

  if ! cmake --version > /dev/null 2>&1; then
    apt update > /dev/null 2>&1 
    apt install cmake -y > /dev/null 2>&1 
  fi

  if [ ! -d "$2" ]; then 
    git clone "$1" "$2"
    cd $2
    git submodule update --init
    mkdir build
    cd build
    cmake ..
    make && sudo make install
  else 
    echo -e "error: $(pwd)/$2 this clone already exists"
  fi
}
