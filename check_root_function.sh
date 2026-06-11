#!/bin/bash

# This function checks if the current user ID equals zero.
# defines a function named check_if_root.
check_if_root(){
# checks if the effective user ID (EUID) is equal to 0, which means root.
# EUID (Effective User ID) is a special Bash variable that stores the ID of the user running the script.
# the root user always has an EUID value of 0.
# regular users have EUID values greater than 0.
if [[ "${EUID}" -eq "0" ]]; then
# returns success (0) when the user is root.
return 0
# executes if the user is not root.
else
# returns failure (1) when the user is not root.
return 1
# ends the if statement.
fi
# ends the function definition.
}
# calls the function and evaluates its return status.
if check_if_root; then
# displays a message when the current user is root.
echo "User is root!"
# executes when the function returns failure.
else
# displays a message when the current user is not root.
echo "User is not root!"
# ends the if statement.
fi