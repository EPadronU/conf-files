#!/usr/bin/env bash

export configuration_files_absolute_path=$(dirname $(readlink -f $0))
export configuration_target_directory=$HOME/.config
export local_share_target_directory=$HOME/.local/share

mkdir -vp $configuration_target_directory
mkdir -vp $local_share_target_directory

ln -vis $configuration_files_absolute_path/konsolerc $configuration_target_directory
ln -vis $configuration_files_absolute_path/konsole $local_share_target_directory

