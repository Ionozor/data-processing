%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
preambule = "space.astro.cz/ionozor/VLF/"
slash = "/"
spec = "spec"
format = ".h5"
sid = "sid_"
under = "_"
path = [preambule observatory slash station slash date slash sid observatory under station under spec format]
data = urlread(path)
disp(['Your requests have been sent succesfully. Now, you can choose some of the providen diagnostics to show the data.'])
disp(['The diagnostics you can choose from are:'])
disp(['1. VLF spectrum;'])
disp(['2. Ionogram;'])
disp(['3. 3D ionospheric model or'])
disp(['4. High-energy impact spectra.'])
disp(['If you want to read some short introduction to each of them, please type command introduction.'])
disp(['If you are happy with the diagnostics, you can choose the appropriate one (diagnostic = "your_request; e.g. diagnostic = "VLF spectrum").'])
disp(['When done, type the command request to show the diagnostic.'])