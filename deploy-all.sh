#!/usr/bin/env bash

# Find and execute all deployment script files within subdirectories, considering the root
# directory to be the one where this script is located.
find $(dirname $0) -iname 'deploy.sh' -exec bash {} \;

######################################################################
# An example of a deployment script
######################################################################

# Get the current location of the deployment file
# $0        -- is set to the name of the file (src: `man bash`)
# realpath  -- print the resolved path (to get the full path for the deployment script file)
# -e        -- all components of the path must exist (to be safe. src: `man realpath`)
# dirname   -- strip last component from file name (remove the filename leaving only the path to it)
#configuration_files_absolute_path=$(dirname $(realpath -e $0))

# Use the XDG standard directory if available
#if [ -n $XDG_CONFIG_HOME ]; then
#  target_directory=$XDG_CONFIG_HOME
#else
#  target_directory=$HOME/.config
#fi

# Particular target directory for these configuration files
#target_directory=$target_directory/bat

# Create the target directory if it doesn't exist
#mkdir -vp $target_directory

# Create the symlinks
#ln -vis $configuration_files_absolute_path/config $target_directory
