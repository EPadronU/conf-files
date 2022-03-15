#!/usr/bin/env bash

configuration_files_absolute_path=$(dirname $(readlink -f $0))
configuration_target_directory=$HOME/.config
local_share_target_directory=$HOME/.local/share

mkdir -vp $configuration_target_directory
mkdir -vp $local_share_target_directory

ln -vis $configuration_files_absolute_path/konsolerc $configuration_target_directory
ln -vis $configuration_files_absolute_path/konsole $local_share_target_directory

