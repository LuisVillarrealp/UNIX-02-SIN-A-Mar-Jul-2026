#!/bin/bash
VARIABLE_ONE=11
VARIABLE_TWO="nostarch"
if [[ "${VARIABLE_ONE}" == "${VARIABLE_TWO}" ]]; then
 echo "They are equal!"
else
 echo "They are not equal!"
fi