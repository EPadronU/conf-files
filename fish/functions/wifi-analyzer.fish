function wifi-analyzer
    set -l interface wlp2s0

    kismet -c $interface:type=linuxwifi
    sudo nmcli dev set wlp2s0 managed yes
end

