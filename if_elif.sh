#!/bin/bash

# stores the first command-line argument in the USER_INPUT variable.
USER_INPUT="${1}"
# checks if no argument was provided.
if [[ -z "${USER_INPUT}" ]]; then
# displays an error message to the user.
echo "You must provide an argument!"
# exits the script with an error status code.
exit 1
# ends the first if statement.
fi
# checks if the argument is an existing regular file.
if [[ -f "${USER_INPUT}" ]]; then
# prints a message indicating that the argument is a file.
echo "${USER_INPUT} is a file."
# checks if the argument is an existing directory.
elif [[ -d "${USER_INPUT}" ]]; then
# prints a message indicating that the argument is a directory.
echo "${USER_INPUT} is a directory."
# executes if the argument is neither a file nor a directory.
else
# prints a message indicating that the path does not exist as a file or directory.
echo "${USER_INPUT} is not a file or a directory."
# ends the second if statement.
fi