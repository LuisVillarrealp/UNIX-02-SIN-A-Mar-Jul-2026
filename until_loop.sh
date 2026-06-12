#!/bin/bash
# stores the name of the file in the FILE variable.
FILE="output1.txt"
# creates the file if it does not already exist.
touch "${FILE}"
# keeps looping until the file contains data.
# checks if the file exists and has a size greater than zero.
until [[ -s "${FILE}" ]]; do
# displays a message indicating that the file is still empty.
    echo "${FILE} is empty..."
# informs the user that the script will check again after 2 seconds.
    echo "Checking again in 2 seconds..."
# pauses the script for 2 seconds before checking again.
    sleep 2
# ends the until loop.
done
# displays a message when the file contains some content.
echo "${FILE} appears to have some content in it!"
