#!/usr/bin/env bash

configuration_files_absolute_path=$(dirname $(readlink -f $0))

ln -vis $configuration_files_absolute_path/configuration $HOME/.config/libinput-gestures.conf
