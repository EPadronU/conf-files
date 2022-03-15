#!/usr/bin/env bash

configuration_files_absolute_path=$(dirname $(readlink -f $0))
target_directory=$HOME/.config/keepassxc

mkdir -vp $target_directory

ln -vis $configuration_files_absolute_path/keepassxc.ini $target_directory/keepassxc.ini
