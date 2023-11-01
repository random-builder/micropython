#!/usr/bin/env bash

#
#
#

trap 'exit' SIGTSTP

while true ; do
    echo "######## MAKE TEST ########"
    rshell --file make_tests.txt
done
