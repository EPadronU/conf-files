#!/usr/bin/env bash

# Get the current location of the deployment file
configuration_files_absolute_path=$(dirname $(realpath -e $0))

# Use the XDG standard directory if available
if [ -n $XDG_CONFIG_HOME ]; then
  target_directory=$XDG_CONFIG_HOME
else
  target_directory=$HOME/.config
fi

# Create the target directory if it doesn't exist
mkdir -vp $target_directory

# Create the symlinks
ln -vis $configuration_files_absolute_path/*rc $target_directory
