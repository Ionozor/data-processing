%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
t0 = data(1,:)
stringt = (1:columns(t))
t = (t0 + stept.*(stringt-1))'
t0 = ceil(H0./24.*rows(t))
t1 = floor(H1./24.*row(t))
t = t(,t0:t1)
nu0 = data(:,1)
stringnu = ((1:rows(nu)))'
nu = nu0 + stepnu.*(stringnu-1)
L0 = data(2:,t0:t1)
L = mean(L0,'g')
plot(L,";15~80 kHz in time t0~t;")
axis('labely')
ylabel"Radio signal intensity level [dB]"
VLF_spectrum = [t nu L]
save -hdf5 VLF_spectrum.h5 VLFspectrum