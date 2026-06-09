#!/usr/bin/env bash
# stores the first command-line argument as the first name.
FIRST_NAME="${1}"
# stores the second command-line argument as the last name.
LAST_NAME="${2}"
# creates the file output.txt if it does not exist, or updates its timestamp if it already exists.
touch output.txt
# writes the current date to output.txt and overwrites any previous content in the file.
date +%d-%m-%Y > output.txt
# adds the user's full name to a new line at the end of output.txt.
echo "${FIRST_NAME} ${LAST_NAME}" >> output.txt
# creates a backup copy of output.txt named backup.txt.
cp output.txt backup.txt
# displays the contents of output.tx on the terminal.
cat output.txt