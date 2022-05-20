#!/usr/bin/env bash

#!/usr/bin/env bash

# Get the current location of the configuration files
configuration_files_absolute_path=$(dirname $(readlink -f $0))

# Try to respect the XDG standard for the target directory
if [ -n $XDG_CONFIG_HOME ]; then
  target_directory=$XDG_CONFIG_HOME
else
  target_directory=$HOME/.config
fi

# Particular target directory for these configuration files
target_directory=$target_directory/fish

# Create the target directory if it doesn't exist
mkdir -vp $target_directory

# Create the symlinks
ln -vis $configuration_files_absolute_path/config.fish $target_directory
ln -vis $configuration_files_absolute_path/fish_plugins $target_directory
ln -vis $configuration_files_absolute_path/conf.d $target_directory
ln -vis $configuration_files_absolute_path/functions $target_directory
ln -vis $configuration_files_absolute_path/completions $target_directory
