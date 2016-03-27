#!/bin/bash
# Michal Žejdl 2016
# daily job for crontab

basedir=~/Dropbox/Octave
bindir=$basedir/bin

yy=$(date -d yesterday +%y)
mm=$(date -d yesterday +%m)
dd=$(date -d yesterday +%d)

for location in HVEZDARNA OSTROV SUN; do
	$bindir/process_data-location.sh $location $yy $mm $dd
done
