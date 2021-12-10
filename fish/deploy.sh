#!/usr/bin/env bash

export configuration_files_absolute_path=$(dirname $(readlink -f $0))
export target_directory=$HOME/.config/fish

mkdir -vp $target_directory

ln -vis $configuration_files_absolute_path/config.fish $target_directory/config.fish
ln -vins $configuration_files_absolute_path/conf.d/ $target_directory/conf.d
ln -vins $configuration_files_absolute_path/functions/ $target_directory/functions
ln -vins $configuration_files_absolute_path/completions/ $target_directory/completions
