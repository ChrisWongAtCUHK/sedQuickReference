#!/usr/bin/bash

if [ $# != 1 ]; then
	echo "Usage: $0 [1~7]"
	echo "1: Numbering lines (same as \"cat -n file.txt\")."	
	echo "2: The problem is that the display is effected on 2 lines. To set this as default:" 
	echo "3: Number the lines but display only the numbers of non-blank lines."
	echo "4: Counting the number of lines (same as \"wc -l file.txt | awk '{ print $1 }'\")."
	exit 1
fi

filename='lines.txt'
case $1 in
	"1")
	    # Numbering lines (same as "cat -n file.txt").
		sed = $filename 
		;;

	"2")
		# The problem is that the display is effected on 2 lines. To set this as default:"
		sed = $filename | sed 'N;s/\n/    /'
		;;
	"3")
		# Number the lines but display only the numbers of non-blank lines.
		sed '/./=' $filename | sed '/./N;s/\n/    /'
		;;
	
	"4")
		# Counting the number of lines (same as "wc -l file.txt | awk '{ print $1 }'").
		sed -n '$=' $filename
		;;

esac
