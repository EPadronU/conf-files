# Fish-shell customization

## Aliases ####################################################################
### Shell-related
# alias -s grep 'grep -E'
# alias -s sql sqlite3
# alias -s cat 'bat --pager=never'
# alias -s wget 'wget --hsts-file=$XDG_DATA_HOME/wget-hsts'

# ### Java-related
# alias -s mvn-generate-new-project 'mvn \
#   archetype:generate \
#   -DarchetypeArtifactId=javase-quickstart \
#   -DarchetypeGroupId=com.smartsystems'

# ### Miscellaneous
# alias -s clocks 'watch -t -d -n 1 zdump America/Caracas America/Los_Angeles America/New_York'
# alias -s sensors 'watch -n 1 sensors'

## Normal-interactive shell configuration #####################################
if status --is-interactive
    set -gx GPG_TTY (tty)

    abbr --add --global cl 'clear'
    abbr --add --global cln 'cleanup -aI'
    abbr --add --global gin 'git init'
    abbr --add --global gst 'git status'
    abbr --add --global gco 'git checkout'
    abbr --add --global gdb 'git diff -b'
    abbr --add --global gdc 'git diff -b --cached'
    abbr --add --global gcm 'git commit -m'
    abbr --add --global gam 'git commit --amend --no-edit --date=now'
    abbr --add --global glg 'git log --graph --all'
    abbr --add --global gln 'git log --name-only'
    abbr --add --global gpf 'git push --force'
    abbr --add --global nvi 'nvm install lts'
end

## Login shell configuration ##################################################
if status --is-login
    # XDG standard
    set -gx XDG_CACHE_HOME $HOME/.cache
    set -gx XDG_CONFIG_HOME $HOME/.config
    set -gx XDG_DATA_HOME $HOME/.local/share
    set -gx XDG_STATE_HOME $HOME/.local/state
    set -gx XDG_DATA_DIRS $XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/nodxine/.local/share/flatpak/exports/share

    # Preferred utilities
    set -gx BROWSER (type -p firefox)
    set -gx VISUAL (type -p nvim)
    set -gx EDITOR $VISUAL
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -gx MANROFFOPT "-c"
    set -gx SDKMAN_DIR $HOME/.sdkman

    # Cleanup my $HOME directory
    set -gx CARGO_HOME $XDG_DATA_HOME/cargo
    set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
    set -gx GOPATH $XDG_DATA_HOME/go
    set -gx GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
    set -gx KDEHOME $XDG_CONFIG_HOME/kde
    set -gx LESSHISTFILE $XDG_DATA_HOME/lesshst
    set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
    set -gx XCOMPOSEFILE $XDG_CONFIG_HOME/X11/XCompose
    set -gx _JAVA_OPTIONS -Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java
    set -gx XCURSOR_PATH /usr/share/icons:$XDG_DATA_HOME/icons

    # PATH
    fish_add_path ~/.local/bin
    fish_add_path $GOPATH/bin

    # Program's tweaks
    set -gx MOZ_X11_EGL 1
    set -gx fish_browser $BROWSER
    set -gx fish_help_browser $BROWSER
    set -gx LESS --quit-if-one-screen --hilite-search --ignore-case --status-column --LONG-PROMPT --LINE-NUMBERS --RAW-CONTROL-CHARS --chop-long-lines --incsearch --no-histdups --save-marks --use-color
end
