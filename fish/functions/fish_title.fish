function fish_title
    set -l command (status current-command)

    if test $command = fish
        echo "▸ $(prompt_pwd)"
    else
        echo "⚡«$command»"
    end
end
