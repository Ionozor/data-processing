#!/bin/bash
# Michal Žejdl 2016
# transform .txt data saved by Spectrum Lab for Octave .m scripts
# run Octave scripts
# move results to archive

if test $# -ne 4; then
	echo "použití: $(basename $0) <zdroj> <yy> <mm> <dd>"
	echo "příklad: $(basename $0) HVEZDARNA 16 02 20"
	exit
fi

location=$1
year=$2
month=$3
day=$4
basedir=~/Dropbox
inputfile="$basedir/$location/sid$day$month$year.txt"
sunfile="$basedir/SUN/sid$day$month$year.txt"

if test ! -f "$inputfile"; then
	echo "nevidím vstupní soubor $inputfile"
	exit
fi

octavedir=$basedir/Octave
workdir=$octavedir/Zpracovani_dat

if test ! -d "$workdir"; then
	echo "nevidím pracovní adresář $workdir"
	exit
fi

outdir="$octavedir/data/$location/20$year/$month/$day"
test -d "$outdir" || mkdir -p "$outdir" || exit

#cd "$workdir"
cd "$outdir" || exit
#test $(ls | wc -l) -gt 0 && rm *

# input data
$octavedir/bin/speclab2octave.sh "$sunfile" x.txt y.txt

case "$location" in
HVEZDARNA|OSTROV)
	$octavedir/bin/speclab2octave.sh "$inputfile" t.txt L.txt
	;;
#SUN)
#	$octavedir/bin/speclab2octave.sh "$inputfile" x.txt y.txt
#	;;
esac

run_script () {
	script=$1
	nice -19 octave "$workdir/${script}.m" >/dev/null 2>${script}.err
	status=$?
	# remove empty stderr
	test -s ${script}.err || rm ${script}.err
	return $status
}

add_zero_line () {
	file=$1
	test -f "$file" && sed -i '1i0' "$file"
}
	
# process data; sed 's/.m ->/ \&\& run_script/g' data_flow_*
case "$location" in
SUN)
	run_script radioteleskop
	run_script energie_radioteleskop
	run_script distance
	;;
esac

# common data flow
case "$location" in
HVEZDARNA|OSTROV)
	run_script impakt
	add_zero_line dTe.txt
	add_zero_line dT_EL.txt
	run_script intenzita
	run_script plasma
	run_script spectrum
	run_script meteoric_spectra
	run_script solar
	;;
esac
