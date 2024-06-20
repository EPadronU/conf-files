#!/usr/bin/env bash

# Get the current location of the deployment file
configuration_files_absolute_path=$(dirname $(realpath -e $0))

# Particular target directory for these configuration files
target_directory=$HOME/.var/app/com.obsproject.Studio/config/obs-studio

if [ -d "$target_directory" ]; then
  # Create the symlinks
  ln -vis $configuration_files_absolute_path/global.ini $target_directory
fi
