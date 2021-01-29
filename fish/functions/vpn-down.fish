###############################################################################
# https://tuxdiary.com/2014/09/04/cisco-anyconnect-vpn-with-openvpn-openconnect/
###############################################################################

function vpn-down
  sudo ifconfig tun1 down; and \
  sudo openvpn --rmtun --dev tun1
end
