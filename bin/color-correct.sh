#!/usr/bin/env bash

######################################################################
# Display color-correction for my MSI Alpha 17 B5EEK Laptop
######################################################################
sleep 4s && xcalib -clear && xcalib -red 1.1 0 85 -green 1.1 0 85 -blue 1.1 0 100 -alter
#sleep 4s && xcalib -clear && xcalib -red 1.1 3 85 -green 1.1 3 85 -blue 1.1 3 100 -alter
