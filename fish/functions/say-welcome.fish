# vim: set nospell:

function say-welcome
    set -l message '<s>Welcome back, <emphasis>sir</emphasis>. Are you ready to keep feeding your curiosity?</s>'

    espeak --stdout -v mb-us2 -s 140 -m $message | aplay -f S16_LE -r 44100 -c 2 2>/dev/null
end
