%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
vyska_ionosfery
h = 6.626*10^-34
c = 3*10^8
k_B = 1.38*10^-23
load plasma_parameter.txt
load debey_radius.txt
lambda_De = debey_radius
N_D = plasma_parameter
p = h0.*(mD-1)
p1 = H.*(1-mD) + pi
n_el = 10.*(exp((2.*N_D./1000.*(p1-p) + B)./B) + 4.*H)
n_el1 = n_el./10^6
plot(t,n_el1)
xlabel"Time interval [t/24 hod.]"
ylabel"Electron density [1/cm3]"
print 'Ejection_density_meteor_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii n_el.txt n_el
close
T_e = 3^2/3.*e^2.*n_el.^1/3.*N_D.^2/3./(epsilon*k_B*(4*pi)^2/3).*lambda_De.^1.2
plot(t,T_e)
xlabel"Time interval [t/24 hod.]"
ylabel"Termodynamic temperature [K]"
print 'Ejection_temperature_meteor_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii T_e.txt T_e
close
n_e = 10.*(exp((2.*N_D./1000000.*(p1-p) + B)./B) + 4.*H)
n_e1 = n_e./10^6
plot(t,n_e1)
xlabel"Time interval [t/24 hod.]"
ylabel"Electron density [1/cm3]"
print 'Ejection_density_sun_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii n_e.txt n_e
close
T_EL = 3^2/3.*e^2.*n_e.^1/3.*N_D.^2/3./(epsilon*k_B*(4*pi)^2/3).*lambda_De.^1.2
plot(t,T_EL)
xlabel"Time interval [t/24 hod.]"
ylabel"Termodynamic temperature [K]"
print 'Ejection_temperature_sun_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii T_EL.txt T_EL
close
lambda_M = 100.*(h*c.*lambda_De.^(N_D./100))./(k_B.*T_e)
plot(t,lambda_M)
xlabel"Time interval [t/24 hod.]"
ylabel"Wavelength [cm]"
print 'Wavelengths_meteor_date.jpg','-dpng','-landscape','-FArial:18'
close
lambda_S = 100.*(h*c.*lambda_De.^(N_D./100))./(k_B.*T_EL)
plot(t,lambda_S)
xlabel"Time interval [t/24 hod.]"
ylabel"Wavelength [cm]"
print 'Wavelengths_sun_date.jpg','-dpng','-landscape','-FArial:18'
close
N = [t n_e1 t n_el1]
save -ascii impact_density.txt N
close
T = [t T_EL t T_e t lambda_S t lambda_M]
save -ascii impact_temperature.txt T
close
dTe = diff(T_e)
save -ascii dTe.txt dTe
close
dT_EL = diff(T_EL)
save -ascii dT_EL.txt dT_EL
close
save -ascii lambda_M.txt lambda_M
close
save -ascii lambda_S.txt lambda_S
close