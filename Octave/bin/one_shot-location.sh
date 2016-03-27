#!/bin/bash
# Michal Žejdl 2016
# run process_data-location.sh for days passed

#for location in HVEZDARNA OSTROV SUN; do
for location in HVEZDARNA; do
#	for yy in 15 16; do for mm in {01..12}; do for dd in {01..31}; do
	for yy in 16; do for mm in {03..03}; do for dd in {18..19}; do
		~/Dropbox/Octave/bin/process_data-location.sh \
			$location $yy $mm $dd >~/os.out 2>~/os.err
	done; done; done
done
