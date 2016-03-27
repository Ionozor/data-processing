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
test $(ls | wc -l) -gt 0 && rm *

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
HVEZDARNA)
	run_script model_SID
	run_script vyboje
	;;
OSTROV)
	run_script model_SID1
	run_script vyboje1
	;;
SUN)
	run_script radioteleskop
	run_script energie_radioteleskop
	run_script distance
	;;
esac

# common data flow
case "$location" in
HVEZDARNA|OSTROV)
	run_script kineticky_model
	add_zero_line hybnost_el.txt
	run_script frekvence
	run_script hustota
	add_zero_line dn.txt
	run_script teplota
	run_script plazmovy_parametr
	run_script kineticka
	add_zero_line hybnost.txt
	run_script potencialni
	run_script rychlost
	add_zero_line zrychleni.txt
	run_script vychyleni
	run_script zrychleni_elektronu
	run_script aktivacni
	run_script ionizace
	run_script vyska_ionosfery
	run_script ionogram
	run_script impakt
	add_zero_line dTe.txt
	add_zero_line dT_EL.txt
	run_script intenzita
	run_script plasma
	run_script tderiv
	add_zero_line dt.txt
	run_script zarivy_tok
	run_script zareni
	run_script teplo
	add_zero_line dQ.txt
	run_script entropie
	run_script spectrum
	run_script meteoric_spectra
	run_script solar
	;;
esac
