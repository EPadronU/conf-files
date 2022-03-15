#!/usr/bin/env bash

configuration_files_absolute_path=$(dirname $(readlink -f $0))
target_directory=$HOME/.config/bat

mkdir -vp $target_directory

ln -vis $configuration_files_absolute_path/config $target_directory/config
