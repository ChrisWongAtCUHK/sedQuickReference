#!/usr/bin/bash

if [ $# != 1 ]; then
	echo "Usage: $0 [1~7]"
	echo "1:Add a blank line after each line"	
	echo "2:" 
	exit 1
fi

case $1 in
	"1")
		# Add a blank line after each line
		cat ti.txt | sed G
		;;
esac
