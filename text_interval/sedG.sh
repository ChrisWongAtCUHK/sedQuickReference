#!/usr/bin/bash

if [ $# != 1 ]; then
	echo "Usage: $0 [1~7]"
	echo "1: Add a blank line after each line."	
	echo "2: Delete all blank line, then add a blank line after each line." 
	echo "3: Add two blank lines after each line."
	echo "4: Delete all lines of even number."
	echo "5: Add a blank line before pattern \"regex\"."
	echo "6: Add a blank line after pattern \"regex\"."
	echo "7: Add a blank line before and after pattern \"regex\"."
	exit 1
fi

filename='lines.txt'

case $1 in
	"1")
		# Add a blank line after each line
		cat $filename | sed G
		;;

	"2")
		# Delete all blank line, then add a blank line after each line."
		cat $filename | sed '/^$/d;G'
		;;
	"3")
		# Add two blank lines after each line.
		cat $filename | sed 'G;G'
		;;
	
	"4")
		# Delete all lines of even number.
		cat $filename | sed 'n;d'
		;;

	"5")
        # Add a blank line before pattern "regex".
		cat $filename | sed '/line5/{x;p;x;}'
		;;

	"6")
        # Add a blank line after pattern "regex".
		cat $filename | sed '/line5/G'
		;;

	"7")
        # Add a blank line before and after pattern "regex".
		cat $filename | sed '/line5/{x;p;x;G;}'
		;;
esac
