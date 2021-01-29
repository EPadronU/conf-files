#!/usr/bin/env bash

export configuration_files_absolute_path=$(dirname $(readlink -f $0))
export target_directory=$HOME/.config/fish

mkdir -p $target_directory

ln -is $configuration_files_absolute_path/config.fish $target_directory/config.fish
ln -ins $configuration_files_absolute_path/conf.d/ $target_directory/conf.d
ln -ins $configuration_files_absolute_path/functions/ $target_directory/functions
ln -ins $configuration_files_absolute_path/completions/ $target_directory/completions
