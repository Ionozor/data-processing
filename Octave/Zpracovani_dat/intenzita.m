%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
load 'n_el.txt'
load 'n_e.txt'
load 'T_e.txt'
load 'T_EL.txt'
load 'critical_frequence_change.txt'
nu_Delta = critical_frequence_change
load 'debey_radius.txt'
lambda_De = debey_radius
load 'electron_density.txt'
n = electron_density
load 'termodynamic_temperature.txt'
T_el = termodynamic_temperature
load 'plasma_parameter.txt'
N_D = plasma_parameter
vyska_ionosfery
e = 1.602*10^-19
k_B = 1.38*10^-23
epsilon = 8.854*10^-12
load activation_energy.txt
E_a = activation_energy.*e
f_nh = (-2.*H.*(mD-1) + h0_t.*(-mD) + h0_t + pi)./B
f_exp = exp(f_nh)
f_T = (-2^4/3.*(mD-1).*N.*(1-mD).*log10(2.71818281).*f_exp)./(3.*B.^2.*N.*(1-mD).*f_exp)
dT = 3^2/3.*e^2.*N_D.^2/3./(epsilon.*k_B.*(4*pi)^2/3).*lambda_De.^6/5.*f_T
load 'dTe.txt'
Z = -1./dTe.*dT
f1 = n_el.*E_a./Z
f2 = k_B.*T_e
f_I = f1.*f2.*exp(-T_el./T_e)
I = abs(log(f_I))
plot(t,I)
xlabel"Time interval [t/24 hrs.]"
ylabel"ln(I) [a.u.]"
print 'Intensity__meteors_date.jpg','-dpng','-landscape','-FArial:18'
close
load 'lambda_M.txt'
plot3(t,lambda_M,I)
xlabel"Time interval [t/24 hrs.]"
ylabel"Wavelength [cm]"
zlabel"Intensity [a.u.]"
print 'Intensity__meteors_1_date.jpg','-dpng','-landscape','-FArial:18'
close
load 'dT_EL.txt'
Z_s = -1./dT_EL.*dT
F1 = n_e.*E_a./Z
F2 = k_B.*T_EL
F_i = f1.*f2.*exp(-T_el./T_EL)
i = abs(log(F_i))
plot(t,i)
xlabel"Time interval [t/24 hrs.]"
ylabel"ln(I) [a.u.]"
print 'Intensity__sun_date.jpg','-dpng','-landscape','-FArial:18'
close
load 'lambda_S.txt'
plot3(t,lambda_S,i)
xlabel"Time interval [t/24 hrs.]"
ylabel"Wavelength [cm]"
zlabel"Intensity [a.u.]"
print 'Intensity__sun_1_date.jpg','-dpng','-landscape','-FArial:18'
close
I_all = [t I t i]
save -ascii intensity.txt I_all
close
R_inf = 3.2899*10^15
b = 2.898*10^-3
lambda = lambda_M./100
T_c = 10.*abs(log(b./lambda))
plot(t,T_c)
xlabel "Time interval [t/24 hrs.]"
ylabel "Termodynamic temperature [K]"
print 'Meteoric_cover_temperature_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii Meteoric_cover_temperature.txt T_c
close
dT = abs(10.*(log(T_c)))
n = (16.*epsilon^3.*k_B^3.*pi^2.*lambda_De.^1.5.*exp(dT./(0.1.*N_D)))./(9.*e^6.*N_D.^2)
plot(t,n)
xlabel "Time interval [t/24 hrs.]"
ylabel "Electron density [1/cm3]"
print 'Meteoric_cover_density_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii Meteoric_cover_density.txt n
close
Lambda = b./T_c
save -ascii Meteoric_cover_wavelengths.txt Lambda
close
z = log(((1.5*R_inf.*sqrt(3*R_inf*c./Lambda))./(1.5*R_inf)))-9
z1 = abs(z - mean(z))
Z = exp(z1)./10
plot3(t,Z,I)
xlabel "Time interval [t/24 hrs.]"
ylabel"Atomic number [-]"
zlabel"Intensity [a.u.]"
print 'Meteoric_cover_spectra_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii Meteoric_cover_spectra.txt Z
close