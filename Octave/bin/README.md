

Algorithms running VLF data analysis are given.
Following scripts 
* speclab2octave.sh, 
* speclab2octave2.sh, 
* process_data.sh 
* process_data-sid.sh

Were written to convert output data from Spectrum Lab to ascii text friendly for GNU Octave.
The algorithm `process_data-location.sh` itself rund the common data flow to solve appropriate equations, draw plots and export ascii text files with the corresponding quantities included.
If there was a blackout affecting some of our stations, we can use `process_data-old.sh` where the same data flow is given to analyse the old, partially kept data.
Some shorter "oneshot" algorithms are written to work better and clearer with the data.
The common data flow is given in `/data-processing/Octave/Zpracovani_dat/README.md`.
The data flow can now be processed within the `SID.m` script, where the appropriate system of equations is given
This system for VLF data analysis was created by Michal Žejdl using data and scripts prepared by Vojtěch Laitl and Jaroslav Maxa.
All rights reserved.
