#!/bin/bash

for ip_address in "$@"; do
 echo "Taking some action on IP address ${ip_address}"
 ping -c 1 "${ip_address}"
done

# loopback address that points to the local machine.
#127.0.0.1
# hostname that resolves to the local loopback address.
#localhost
# alternative loopback address that also points to the local machine.
#127.0.0.2
# private IPv4 address assigned to the current network interface.
#10.0.14.47
# private IP address commonly used by Docker bridge networks.
#172.17.0.1