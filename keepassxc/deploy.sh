#!/usr/bin/env bash

export configuration_files_absolute_path=$(dirname $(readlink -f $0))
export target_directory=$HOME/.config/keepassxc

mkdir -vp $target_directory

ln -vis $configuration_files_absolute_path/keepassxc.ini $target_directory/keepassxc.ini
