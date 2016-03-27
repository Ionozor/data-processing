#!/bin/bash
# Michal Žejdl 2016
# generate data files for Octave from past days

basedir=~/Dropbox/Octave
bindir=$basedir/bin
datadir=$basedir/data
s2o=$bindir/speclab2octave.sh

for dir in HVEZDARNA OSTROV SUN; do
	echo $dir
	for y in 15 16; do for m in {01..12}; do for d in {01..31}; do
		inputfile=~/Dropbox/$dir/sid$d$m$y.txt
		test -f $inputfile || continue
		echo "found file $inputfile"
		destdir=$datadir/$dir/$y$m$d
		mkdir -p $destdir
		if test $dir == SUN; then
			$s2o $inputfile $destdir/x.txt $destdir/y.txt
		else
			$s2o $inputfile $destdir/t.txt $destdir/L.txt
		fi
	done; done; done		
done
