function fish_title
    set -l command (status current-command)
    set -l working_dir (prompt_pwd)

    if test $command = fish
        echo "⚓ $working_dir ⚓"
    else
        echo "⚙ «$command» at [$working_dir] ⚙"
    end
end
