#!/usr/bin/env bash

sudo apt-get update

sudo apt-get install -y gcc-multilib
sudo apt-get install -y make
sudo apt-get install -y gdb
sudo apt-get install -y radare2
sudo apt-get install -y python3-pip
sudo apt-get install -y python2.7 python-pip

# ROP
sudo pip3 install capstone
pip3 install ropgadget