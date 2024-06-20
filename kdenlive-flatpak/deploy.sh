#!/usr/bin/env bash

# Get the current location of the deployment file
configuration_files_absolute_path=$(dirname $(realpath -e $0))

# Particular target directory for these configuration files
target_directory=$HOME/.var/app/org.kde.kdenlive/config

if [ -d "$target_directory" ]; then
  # Create the symlinks
  ln -vis $configuration_files_absolute_path/kdenlive-flatpakrc $target_directory
  ln -vis $configuration_files_absolute_path/kdenlive-layoutsrc $target_directory
fi
