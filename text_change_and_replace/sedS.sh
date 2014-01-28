#!/usr/bin/bash

if [ $# != 1 ]; then
	echo "Usage: $0 [1~7]"
	echo "1: Remove leading space(s)."	
	echo "2: Remove tailing space(s)."	
	echo "3: Replace \"foo\" by \"bar\" if \"bar\" exists"
	echo "4: Replace \"foo\" by \"bar\" if \"bar\" does not exist"
	echo "5: Reverse the lines order-method 1.(Simulate \"tac\")"
	echo "6: Reverse the lines order-method 2.(Simulate \"tac\")"
	echo "7: Reverse the characters order for each line.(Simulate \"rev\")"
	echo "8: If a line ends with '\\', append the next line to it and remove the '\\'"
	echo "9: If a line starts with '=', append the previous line to it and replace the '=' with a space"
	exit 1
fi

file1='lines.txt'
file2='backslash.txt'
file3='foobar.txt'
file4='eqsign.txt'
file5='no_comma.txt'
outfile1='lines.out'

case $1 in
	"1")
		#  Remove leading space(s).
		sed 's/^[ ]*//' $file1
		;;

	"2")
	    # Remove tailing space(s). Output redirect to see the effect(View by vim with :set list).
		sed 's/[ ]*$//' $file1 > $outfile1
		;;

	"3")
		# Replace \"foo\" by \"bar\" if \"bar\" exists.
		sed '/bar/s/foo/bar/g' $file3
		;;
		
	"4")
		# Replace \"foo\" by \"bar\" if \"bar\" does exist.
		sed '/bar/!s/foo/bar/g' $file3
		;;

	"5")
		# Reverse the lines order-method 1.(Simulate "tac")
		sed '1!G;h;$!d' $file1
		;;
	
	"6")
		# Reverse the lines order-method 2.(Simulate "tac")
		sed -n '1!G;h;$p' $file1
		;;
	"7")
        # Reverse the characters order for each line.(Simulate "rev")
    	sed '/\n/!G;s/\(.\)\(.*\n\)/&\2\1/;//D;s/.//' $file1
	    ;;

	"8")
		# If a line ends with '\\', append the next line to it and remove the '\\'
	    sed 'N;s/\\\n//' $file2
		;;

	"9")
		# If a line starts with '=', append the previous line to it and replace the '=' with a space
	    sed 'N;s/\n=/ /' $file4
		;;


esac
