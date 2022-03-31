#!/usr/bin/env bash

configuration_files_absolute_path=$(dirname $(readlink -f $0))
target_directory=$HOME/.config/nvim

mkdir -vp $target_directory

ln -vis $configuration_files_absolute_path/init.lua $target_directory/init.lua
ln -vis $configuration_files_absolute_path/lua $target_directory/lua
