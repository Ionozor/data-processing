%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
load 'lambda_S.txt'
load 'debey_radius.txt'
load 'plasma_parameter.txt'
c = 3*10^8
b = 2.898*10^-3
epsilon = 8.854*10^-12
k_B = 1.38*10^-23
e = 1.602*10^-19
R_inf = 3.2899*10^15
lambda_De = debey_radius
N_D = plasma_parameter
lambda = lambda_S./100
dT = 10.*abs(log(b./lambda))
T = exp(dT./10)
plot(t,T)
xlabel"Time interval [t/24 hrs.]"
ylabel"Solar impacts' temperature [K]"
print 'Solar_impact_temperature_date.jpg','-dpng','-landscape','-FArial:18'
close
semilogy(t,T)
xlabel"Time interval [t/24 hrs.]"
ylabel"Solar impacts' temperature [K]"
print 'Solar_impact_temperature_date_1.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii Solar_temperature.txt T
close
n = (16.*epsilon^3.*k_B^3.*pi^2.*lambda_De.^1.5.*T)./(9.*e^6.*N_D.^2)
plot(t,n)
xlabel"Time interval [t/24 hrs.]"
ylabel"Solar impacts' electron density [1/cm3]"
print 'Solar_impact_density_date.jpg','-dpng','-landscape','-FArial:18'
close
semilogy(t,n)
xlabel"Time interval [t/24 hrs.]"
ylabel"Solar impacts' electron density [1/cm3]"
print 'Solar_impact_density_date_1.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii Solar_density.txt n
close
Lambda = b./T
Z = abs(log(((1.5*R_inf.*sqrt(3*R_inf*c./Lambda))./(1.5*R_inf))) - 29)
plot(t,Z)
xlabel"Time interval [t/24 hrs.]"
ylabel"Hypothetic atomic number [-]"
print 'Solar_emission_spectra.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii Solar_atomic_numbers.txt Z
close
save -ascii Solar_wavelengths.txt Lambda
close