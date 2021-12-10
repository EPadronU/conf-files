#!/usr/bin/env bash

export configuration_files_absolute_path=$(dirname $(readlink -f $0))
export target_directory=$HOME/.config/nvim

mkdir -vp $target_directory

ln -vis $configuration_files_absolute_path/init.vim $target_directory/init.vim
