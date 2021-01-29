###############################################################################
# https://tuxdiary.com/2014/09/04/cisco-anyconnect-vpn-with-openvpn-openconnect/
###############################################################################

function vpn-up
  sudo modprobe --first-time tun
  sudo openvpn --mktun --dev tun1; and \
  sudo ifconfig tun1 up; and \
  sudo openconnect sfvpn.ascentis.com --interface=tun1
end
