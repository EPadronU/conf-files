function hdmi-sound
    pacmd load-module module-alsa-sink device=hw:0,7
    pacmd load-module module-combine-sink sink_name=combined
    pacmd set-default-sink combined
end
