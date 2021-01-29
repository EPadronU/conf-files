#!/usr/bin/env bash

export configuration_files_absolute_path=$(dirname $(readlink -f $0))
export target_directory=$HOME/.config/git

mkdir -p $target_directory

ln -is $configuration_files_absolute_path/gitconfig $target_directory/config
