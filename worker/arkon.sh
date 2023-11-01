#!/usr/bin/env bash

#
#
#

#set -e -u

readonly base_dir=$( cd $( dirname "$0" )/.. && pwd )
readonly espidf_dir=$( cd $base_dir/esp-idf && pwd )
readonly worker_dir=$base_dir/worker

cd $base_dir

echo "### base_dir=$base_dir"
echo "### espidf_dir=$espidf_dir"
echo "### worker_dir=$worker_dir"
echo "### python=$(which python)"
