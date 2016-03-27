#!/bin/bash
# Michal Žejdl 2016
# run process_data-sid.sh for days passed

for location in HVEZDARNA OSTROV; do
	for yy in 15 16; do for mm in {01..12}; do for dd in {01..31}; do
		~/Dropbox/Octave/bin/process_data-sid.sh $location $yy $mm $dd \
			>~/os.out 2>~/os.err
	done; done; done
done
