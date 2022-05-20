#!/usr/bin/env bash

# Get the current location of the configuration files
configuration_files_absolute_path=$(dirname $(readlink -f $0))

# Try to respect the XDG standard for the configuration directory
if [ -n $XDG_CONFIG_HOME ]; then
  configuration_target_directory=$XDG_CONFIG_HOME
else
  configuration_target_directory=$HOME/.config
fi

# Try to respect the XDG standard for the data directory
if [ -n $XDG_DATA_HOME ]; then
  data_target_directory=$XDG_DATA_HOME
else
  data_target_directory=$HOME/.local/share
fi

# Create the directories if they don't exist
mkdir -vp $configuration_target_directory
mkdir -vp $data_target_directory

# Create the symlinks
ln -vis $configuration_files_absolute_path/konsolerc $configuration_target_directory
ln -vis $configuration_files_absolute_path/konsole $data_target_directory
