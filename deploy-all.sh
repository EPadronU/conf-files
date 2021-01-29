#!/usr/bin/env bash

find $(dirname $0) -iname 'deploy.sh' -exec bash {} \;
