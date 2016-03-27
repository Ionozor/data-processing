#!/bin/bash
# Michal Žejdl 2016
# run process_data-old.sh for days passed

for location in HVEZDARNA OSTROV SUN; do
	for yy in 15 16; do for mm in {01..12}; do for dd in {01..31}; do
		~/Dropbox/Octave/bin/process_data-old.sh \
			$location $yy $mm $dd
	done; done; done
done
