#!/usr/bin/env bash

# Get the current location of the files
files_absolute_path=$(dirname $(readlink -f $0))

# Particular target directory for these files
target_directory=$HOME/.local/bin

# Create the target directory if it doesn't exist
mkdir -vp $target_directory

# Create the symlinks
find $files_absolute_path -type f -not -iname 'deploy.sh' -exec ln -vis {} $target_directory \;
