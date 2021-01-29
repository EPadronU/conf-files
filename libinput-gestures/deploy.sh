#!/usr/bin/env bash

export configuration_files_absolute_path=$(dirname $(readlink -f $0))

ln -is $configuration_files_absolute_path/configuration $HOME/.config/libinput-gestures.conf
