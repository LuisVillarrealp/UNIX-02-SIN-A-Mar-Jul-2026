#!/bin/bash
# uses Bash as the interpreter for this script.
# stores the name of the file that will stop the loop.
SIGNAL_TO_STOP_FILE="stoploop"
# keeps looping while the stop file does not exist.
# checks if the file does not exist.
while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do
# displays a message indicating that the file has not been found yet.
    echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exist..."
# informs the user that the script will check again after 2 seconds.
    echo "Checking again in 2 seconds..."
# pauses the script for 2 seconds before checking again.
    sleep 2
# ends the while loop.
done
# displays a message when the file is found and the loop ends.
echo "File was found! Exiting..."