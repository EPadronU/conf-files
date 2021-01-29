# Fish customization

## Aliases ####################################################################
### Linux
alias grep 'grep -E'
alias sensors 'watch -n 1 sensors'
alias sql 'sqlite3'
### Java
alias mvn-generate-new-project 'mvn archetype:generate -DarchetypeArtifactId=javase-quickstart -DarchetypeGroupId=com.smartsystems'

## Global enviroment variables ################################################
if status --is-login
  set -gx PATH $PATH ~/.local/bin
  set -gx BROWSER (type -p vivaldi-snapshot)
  set -gx EDITOR (type -p nvim)
  set -gx MOZ_X11_EGL 1
  set -gx fish_browser $BROWSER
  set -gx fish_help_browser $BROWSER
end

## Bindings
bind \e\* insert-completions

### bobthefish
set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose no
set -g theme_display_git_dirty_verbose no
set -g theme_display_git_stashed_verbose no
set -g theme_display_git_default_branch yes
set -g theme_git_default_branches master main
set -g theme_git_worktree_support no
set -g theme_use_abbreviated_branch_name no
set -g theme_display_vagrant no
set -g theme_display_docker_machine no
set -g theme_display_k8s_context no
set -g theme_display_k8s_namespace no
set -g theme_display_hg no
set -g theme_display_virtualenv no
set -g theme_display_nix no
set -g theme_display_ruby no
set -g theme_display_node yes
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_display_sudo_user yes
set -g theme_display_vi no
set -g theme_display_date yes
set -g theme_display_cmd_duration yes
set -g theme_date_format "+❲%^a, %^b %d❳⇼❲%I:%M:%S %^p❳"
set -g theme_date_timezone America/Bogota
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts no
set -g theme_show_exit_status yes
set -g theme_display_jobs_verbose no
set -g default_user nodxine
set -g theme_color_scheme light
set -g fish_prompt_pwd_dir_length 1
set -g theme_project_dir_length 1
set -g theme_newline_cursor no
set -g theme_newline_prompt '$ '
set -g theme_title_display_process yes
set -g theme_title_display_path no
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path yes
