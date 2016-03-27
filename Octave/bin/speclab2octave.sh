#!/bin/bash
# Michal Žejdl 2016
# prints first two columns, converts time

if test $# -ne 3; then
	echo "usage: $(basename $0) <input_file> <output_file1> <output_file2>"
	exit
fi

input_file=$1
output_file1=$2
output_file2=$3

test -e "$input_file" || exit

# time
awk -F, '{if (FNR != 1) print $1}' "$input_file" | awk '{print $2}' | awk -F: '{printf "%.9f\n", (3600 * $1 + 60 * $2 + $3) / 86400}' >"$output_file1"

# data
awk -F, '{if (FNR != 1) print $2}' "$input_file" >"$output_file2"
