

Algorithms running VLF data analysis are given.

Recently, new scripts 
* `SID1.m` and 
* `pathlocation.m` 
were added. All of the diagnostics given in `/data-processing/Octave/Zpracovani_dat/README.md` within the data flow are now simplified using such a script. The supplemental one, `pathlocation.m`  runs the data processing within the currently operationg stations using the data storage at space.astro.cz/ionozor/VLF/.

If the scripts are being run using a physical or virtual computer, it is necessary to create a directory from where the data will be uploaded at space.astro.cz.

It should contain the initial folder /.../folder/ionozor/VLF/"stations"/"years/"months"/. From the location /.../folder/, the scripts themselves are up to be operated. The subfolders need to be written in accordance with the measuring stations and their names. Into each station's subfolder, the year and month subsubfolders have to be created. An example of such directories can be sent.

Following BASH scripts 
* `speclab2octave.sh`, 
* `speclab2octave2.sh`, 
* `process_data.sh` and 
* `process_data-sid.sh`

were written and originally used to convert output data from Spectrum Lab to ascii text friendly for GNU Octave. They may be used by some testing or experimental stations if a quick data tooling or reconstruction was needed. However, they will not be compiled for the whole Ionozor group.
The algorithm `process_data-location.sh` itself rund the common data flow to solve appropriate equations, draw plots and export ascii text files with the corresponding quantities included.
If there was a blackout affecting some of our stations, we can use `process_data-old.sh` where the same data flow is given to analyse the old, partially kept data.
Some shorter "oneshot" algorithms are written to work better and clearer with the data.
The common data flow is given in `/data-processing/Octave/Zpracovani_dat/README.md`.
The data flow can now be processed within the `SID.m` script, where the appropriate system of equations is given.

The bash system for VLF data analysis was created by Michal Žejdl using data and scripts prepared by Vojtěch Laitl and Jaroslav Maxa. The simplification and new GNU Octave scripts were prepared by Vojtěch Laitl.
All rights reserved.


