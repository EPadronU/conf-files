function droidcam-activate
    sudo modprobe videodev
    sudo modprobe v4l2loopback_dc
    sudo modprobe snd-aloop
    #pacmd load-module module-alsa-source device=hw:1,1,1
end
