#!/bin/bash
# Michal Žejdl 2016
# prints first two columns, converts time

if test $# -ne 2; then
	echo "usage: $(basename $0) <input_file> <output_file>"
	exit
fi

input_file=$1
output_file=$2

test -e "$input_file" || exit

# time & data
awk -F, '{if (FNR != 1) print $1, $2}' "$input_file" | awk '{print $2":"$3}' | awk -F: '{printf "%.9f ", (3600 * $1 + 60 * $2 + $3) / 86400; print $4}' >"$output_file"
