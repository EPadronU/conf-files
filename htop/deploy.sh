#!/usr/bin/env bash

export configuration_files_absolute_path=$(dirname $(readlink -f $0))
export target_directory=$HOME/.config/htop

mkdir -p $target_directory

ln -is $configuration_files_absolute_path/htoprc $target_directory/htoprc
