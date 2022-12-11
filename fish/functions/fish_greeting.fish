function fish_greeting -d "What's up, fish?"
    return 1
    set_color $fish_color_autosuggestion
    echo -e '◖■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ WELCOME ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■◗'
    nodxyfetch
    set_color $fish_color_autosuggestion
    echo -e '◖■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■◗'
    set_color normal
end
