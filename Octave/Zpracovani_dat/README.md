GNU Octave scripts for VLF data analysis are given.
The results are saved into ascii text files, while the corresponding plots are drawn and saved as JPEG pictures. 
The first model we work with is called kineticky_model.m. Spectrum Lab used for the measurement works with the radio transmitter's gain [dB]. If we want to work out some basic diagnostic for the ionosphere, though, we would rather know the signal's frequency change caused by the refraction.
A polynomial equation computing linear momentum in the ionospheric plasma is included in kineticky_model.m, so we can use an approximation to work out the frequency change.
By the time the frequence change is computed, we can solve the equations referring to the electron plasma frequency and the total electron density in the ionosphere as the functions dependent on the time.
When these parameters are known, we are able to determine other quantities, such as the Debye radius, the plasma temperature and so on. Using the approximation of the DGR models (http://www.annalsofgeophysics.eu/index.php/annals/article/viewFile/4130/4197) a simple ionogram can be drawn.
Within those basic models we can work out the momental electron density and plasma temperature change. If the variables are computed as a differential equations' system, some parameters of impact involving the atmosphere can be approached. We are able to detect meteors and compute their electron density and the plasma temperatue. Some models have also been created within the spectral analysis and we tried to set the Sun eruptions's analysis as well.
The common data flow is
model_SID.m
vyboje.m
kineticky_model.m
frekvence.m
hustota.m
teplota.m
plazmovy_parametr.m
kineticka.m
potencialni.m
rychlost.m
vychyleni.m
zrychleni_elektronu.m
aktivacni.m
ionizace.m
vyska_ionosfery.m
ionogram.m
impakt.m
intenzita.m
plasma.m
tderiv.m
zarivy_tok.m
zareni.m
teplo.m
entropie.m
spectrum.m
meteoric_spectra.m
solar.m
All of the scripts are run from the folder data-processing/Octave/bin/. The input ascii files including time and gain level are created within those algorithms as well.
This data analysis system has been created by Vojtěch Laitl and Michal Žejdl. All rights are reserved.
