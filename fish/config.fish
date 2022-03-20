# Fish-shell customization

## Aliases ####################################################################
### Shell-related
alias grep 'grep -E'
alias sql sqlite3
alias cat 'bat --pager=never'
alias MANPAGER "sh -c 'col -bx | batcat -l man -p'"

### Java-related
alias mvn-generate-new-project 'mvn \
  archetype:generate \
  -DarchetypeArtifactId=javase-quickstart \
  -DarchetypeGroupId=com.smartsystems'

### Miscellaneous
alias clocks 'watch -t -d -n 1 zdump America/Caracas America/Los_Angeles America/New_York'
alias sensors 'watch -n 1 sensors'

## Normal-interactive shell configuration #####################################
if status --is-interactive
    set -gx GPG_TTY (tty)
    set -uq fish_private_mode && set -gx fish_private_mode $fish_private_mode
end

## Login shell configuration ##################################################
if status --is-login
    fish_add_path ~/.local/bin

    set -gx BROWSER (type -p firefox)
    set -gx EDITOR (type -p nvim)
    set -gx MOZ_X11_EGL 1
    set -gx fish_browser $BROWSER
    set -gx fish_help_browser $BROWSER
    set -gx LESS --quit-if-one-screen --hilite-search --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --chop-long-lines --no-histdups --save-marks

    abbr --add --global gin 'git init'
    abbr --add --global gco 'git checkout'
    abbr --add --global gcm 'git commit -m'
    abbr --add --global gam 'git commit -a --amend --no-edit --date=now'
    abbr --add --global glg 'git log --graph --all'
    abbr --add --global gln 'git log --name-only'
end
