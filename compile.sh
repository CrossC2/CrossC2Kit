#!/bin/bash

cp -r third-party /tmp/third-party
cd /tmp/third-party
for module in `find ./ | grep "makefile" | awk -F'/makefile' '{print $1}'`
do
    cd /tmp/third-party
    cd $module
    make
    make clean
done