function __fish_windscribe_no_command --description 'Test if windscribe has yet to be given the main command'
  set cmd (commandline -opc)

  if [ (count $cmd) -eq 1 ]
    return 0
  end

  return 1
end

function __fish_windscribe_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 2 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

function __fish_windscribe_specifying_locations
    if not set -q __fish_windscribe_locations
        set -gx __fish_windscribe_locations (windscribe locations | tail -n +2 | awk -F '[ ][ ]+' '{if ($5 != "*") printf "%s,", $4} end')
    end

    echo $__fish_windscribe_locations | tr ',' '\n'
end

complete -c windscribe -f
complete -c windscribe -f -l help
complete -c windscribe -f -n '__fish_windscribe_no_command' -a status -d 'Check status of Windscribe and connection'
complete -c windscribe -f -n '__fish_windscribe_no_command' -a account -d 'Output current account details'
complete -c windscribe -f -n '__fish_windscribe_no_command' -a connect -d 'Connect to Windscribe'
complete -c windscribe -f -n '__fish_windscribe_using_command connect' -a 'best'
complete -c windscribe -f -n '__fish_windscribe_using_command connect' -a "(__fish_windscribe_specifying_locations)"
complete -c windscribe -f -n '__fish_windscribe_no_command' -a disconnect -d 'Disconnect from VPN'
complete -c windscribe -f -n '__fish_windscribe_no_command' -a examples -d 'Show usage examples'
complete -c windscribe -f -n '__fish_windscribe_no_command' -a firewall -d 'View/Modify Firewall mode'
complete -c windscribe -f -n '__fish_windscribe_using_command firewall' -a 'on off'
complete -c windscribe -f -n '__fish_windscribe_no_command' -a lanbypass -d 'View/Modify Firewall LAN bypass'
complete -c windscribe -f -n '__fish_windscribe_no_command' -a locations -d 'Output list of all available server locations'
complete -c windscribe -f -n '__fish_windscribe_no_command' -a login -d 'Login to Windscribe account'
complete -c windscribe -f -n '__fish_windscribe_no_command' -a logout -d 'Logout and disconnect'
complete -c windscribe -f -n '__fish_windscribe_no_command' -a port -d 'View/Modify default Port'
complete -c windscribe -f -n '__fish_windscribe_no_command' -a protocol -d 'View/Modify default Protocol'
complete -c windscribe -f -n '__fish_windscribe_using_command protocol' -a 'TCP UDP'
complete -c windscribe -f -n '__fish_windscribe_no_command' -a proxy -d 'View/Modify Proxy Settings'
complete -c windscribe -f -n '__fish_windscribe_no_command' -a sendlog -d 'Send the debug log to Support'
complete -c windscribe -f -n '__fish_windscribe_no_command' -a speedtest -d 'Test the connection speed'
complete -c windscribe -f -n '__fish_windscribe_no_command' -a viewlog -d 'View the debug log'
