#!/bin/bash

# stores the first command-line argument in the IP_ADDRESS variable.
IP_ADDRESS="${1}"
# evaluates the IP address against different patterns.
case ${IP_ADDRESS} in
# matches any IP address that starts with 192.168.
    192.168.*)
# displays a message indicating the IP belongs to the 192.168.x.x network.
        echo "Network is 192.168.x.x"
# ends this case option.
    ;;
# matches any IP address that starts with 10.0.
    10.0.*)
# displays a message indicating the IP belongs to the 10.0.x.x network.
        echo "Network is 10.0.x.x"
# ends this case option.
    ;;
# matches any other value not covered by the previous patterns.
    *)
# displays a message when the network cannot be identified.
        echo "Could not identify the network"
# ends this case option.
    ;;
# ends the case statement.
esac
# Ips used to evaluate
# 192.168.1.hola
# 10.0.1.ho
# 127.0.1.0