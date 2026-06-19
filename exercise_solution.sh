#!/bin/bash
# stores the first command-line argument in the NAME variable.
NAME="${1}"
# stores the second command-line argument in the DOMAIN variable.
DOMAIN="${2}"
# stores the name of the output CSV file.
OUTPUT_FILE="results.csv"
# checks if either of the required arguments is missing.
if [[ -z "${NAME}" ]] || [[ -z "${DOMAIN}" ]]; then
  # displays an error message if the required arguments were not provided.
  echo "You must provide two arguments to this script."
  # displays an example of how to run the script.
  echo "Example: ${0} mysite nostarch.com"
  # exits the script with an error status code.
  exit 1
# ends the if statement.
fi
# writes the CSV header to the output file, replacing any existing content.
echo "status,name,domain,timestamp" > "${OUTPUT_FILE}"
# checks whether the specified domain responds to a ping request.
if ping -c 1 "${DOMAIN}" &> /dev/null; then
  # writes a success record to the CSV file if the ping succeeds.
  echo "success,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}"
# executes if the ping request fails.
else
  # writes a failure record to the CSV file if the ping fails.
  echo "failure,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}"
# ends the if statement.
fi
# delays the script for 1000 seconds to keep the process running before it terminates.
sleep 1000