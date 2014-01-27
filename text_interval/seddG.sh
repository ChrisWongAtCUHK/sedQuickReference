#!/usr/bin/bash

# Delete all blank line,
#  then add a blank line after each line,
#  such that each line will have only one blank line after it
cat seddG.txt | sed '/^$/d;G'
