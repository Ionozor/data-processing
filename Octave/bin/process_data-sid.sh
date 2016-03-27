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

$octavedir/bin/speclab2octave.sh "$inputfile" $workdir/t.txt $workdir/L.txt

cd "$workdir"

run_script () {
	script=$1
	nice -19 octave ${script}.m >/dev/null 2>${script}.err
	# remove empty stderr
	test -s ${script}.err || rm ${script}.err
}

run_script kineticky_model
test -f hybnost_el.txt || exit
sed -i '1i0' hybnost_el.txt
run_script frekvence
run_script teplota

outdir="$octavedir/data/$location/20$year/$month/$day"

test -d "$outdir" || mkdir -p "$outdir" || exit

mv t.txt L.txt hybnost_el.txt critical_frequence_change.txt debey_radius.txt \
	*.err *.jpg "$outdir"
