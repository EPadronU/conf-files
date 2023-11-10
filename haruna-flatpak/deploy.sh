#!/usr/bin/env bash

# Get the current location of the configuration files
configuration_files_absolute_path=$(dirname $(readlink -f $0))

# Particular target directory for these configuration files
target_directory=$HOME/.var/app/org.kde.haruna/config/haruna

if [ -d "$target_directory" ]; then
  # Create the symlinks
  ln -vis $configuration_files_absolute_path/haruna.conf $target_directory
  ln -vis $configuration_files_absolute_path/haruna-custom-commands.conf $target_directory
fi
