%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
load 'lambda_M.txt'
load 'debey_radius.txt'
lambda_De = debey_radius
load 'plasma_parameter.txt'
N_D = plasma_parameter
lambda = lambda_M./100
b = 2.898*10^-3
c = 3*10^8
k_B = 1.38*10^-23
epsilon = 8.854*10^-12
e = 1.602*10^-19
T = 10.*abs(log(b./lambda))
plot(t,T)
xlabel"Time interval [t/24 hrs.]"
ylabel"Effective temperature [K]"
print 'Effective_temperature_meteor_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii Effective_temperature.txt
close
Lambda = b./T
save -ascii Emission_wavelenghts.txt Lambda
close
R_inf = 3.2899*10^15
Z = log(((1.5*R_inf.*sqrt(3*R_inf*c./Lambda))./(1.5*R_inf)))-9
plot(t,Z)
xlabel"Time interval [t/24 hrs.]"
ylabel"Hypothetic atomic number [-]"
print 'Emission_spectra_meteor_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii Emission_atomic_numbers.txt Z
close
dT = abs(10.*(log(T)))
n = (16.*epsilon^3.*k_B^3.*pi^2.*lambda_De.^1.5.*exp(dT./(0.1.*N_D)))./(9.*e^6.*N_D.^2)
semilogy(t,n)
xlabel "Time interval [t/24 hrs.]"
ylabel "Electron density [1/cm3]"
print 'Emission_density_meteor_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii Emission_electron_density.txt n
close