# Fish customization

## Aliases ####################################################################
### Linux
alias grep 'grep -E'
alias sensors 'watch -n 1 sensors'
alias sql 'sqlite3'
alias clocks 'watch -t -d -n 1 zdump America/Caracas America/Los_Angeles America/New_York'
#alias bat batcat
alias cat 'bat --pager=never'
alias MANPAGER "sh -c 'col -bx | batcat -l man -p'"
### Java
alias mvn-generate-new-project 'mvn archetype:generate -DarchetypeArtifactId=javase-quickstart -DarchetypeGroupId=com.smartsystems'

## Global enviroment variables ################################################
if status --is-login
  set -gx PATH $PATH ~/.local/bin
  set -gx BROWSER (type -p firefox)
  set -gx EDITOR (type -p nvim)
  set -gx MOZ_X11_EGL 1
  set -gx fish_browser $BROWSER
  set -gx fish_help_browser $BROWSER
  set -gx LESS --quit-if-one-screen --hilite-search --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --chop-long-lines --no-histdups --save-marks
end

## Per-shell enviroment variables #############################################
set -gx GPG_TTY (tty)

## Bindings
bind \e\* insert-completions
