# Configuration files

## About this repository

Here lies my most important configuration files (.rc files among others) for
the different applications I use in my Linux machine.

## File structure

There's one folder per application/program/command containing all its related
configuration files.

## Deploying the configuration files

There's a global companion script that will trigger the generation of symbolic
links under the user's home directory for the configuration files contained in
this repository.  Such a script relies upon the `deploy.sh` scripts that should
be located inside each sub-folder, scripts that are responsable of creating the
symlinks for their corresponding application/program/command.
