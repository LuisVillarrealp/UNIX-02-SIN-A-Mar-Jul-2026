#!/bin/bash

# loops through all files whose names start with "example_file".
for file in example_file*; do
# checks if the current file is example_file1.
 if [[ "${file}" == "example_file1" ]]; then
# displays a message indicating that the first file will be skipped.
  echo "Skipping the first file"
# skips the rest of the current loop iteration and moves to the next file.
continue
# ends the if statement.
 fi
# writes a random number into the current file, replacing any existing content.
 echo "${RANDOM}" > "${file}"
# ends the for loop.
done