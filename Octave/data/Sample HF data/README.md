Some sample data acquired by the HF measurement are given. They were chosen from December 21, 2015 when strong radio outbursts coming from a very young star were detected. For more informations, see for example https://www.spacetelescope.org/images/potw1551a/.
The data were analysed by the common scripts within GNU Octave which is given in the appropriate repository.
Let's go through the results graph to graph.
- Radio telescope:
In this plot, the radio signal intesity level measured on the frequency 20.1 MHz is shown. If this exact frequency is used, the Sun and Jupiter can be monitored in the radio spectrum very easily. However, using our models and a transformation system, we can detect some stong impacts from the deep space, too.
We can see the dependence could be described as an oscillation function, while the relative amplitude of strong peaks sharply differs from the basic state.
- X-ray energy:
If the radio signal intensity level is known, we can computed the value of radiated energy. Within our approximation, the basic formulas describing the power and the energy of a homogenous transmitter was used. The approximation is invariant for the condition t << 1, which is filled.
Such a model provides the current X-ray energy and the amount of radiated photons can be computed, too.
- Ray-burst distance:
By the time the current X-ray energy is known, the ray burst's distance can be modeled. The appropriate numerical solution is given by the differential equations' system describing the linear momentum and the angular momentum.
It can be deduced, that the hypothetic distance significantly differs in the time. However, the strong emission was detected clearly and the single peaks approach each other well.
- Stellar effective temperature:
When compared with the VLF measurement, the effective temperature of the investigated young star can be modeled. We can see, that the maximal temperature converges to the value of 7000 K. Within the Wien's Displacement Law, the current emission wavelenght can be computed. The results were written into the ASCII text file -Emission_wavelengths_stellar.txt.
- Stellar emission spectra:
The wavelenght where the most of energy is currently radiated enables us to draw the time-dependent emission spectrum. We can see that the elements with atomic numbers from 1 to 7 (from hydrogen to nitrogen) were detected in measurable intensity, which can ben a pretty good description for the emission spectra of a young star.
- ASCII text files:
The discussed data were also uploaded in the ASCII text files. In the file "x.txt", the time in format [t/24 hrs.] is given while the radio signal intensity level was written into the "y.txt" file.

The data were prepared by Vojtěch Laitl and Jaroslav Maxa. All rights reserved.

