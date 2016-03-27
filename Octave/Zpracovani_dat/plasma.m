%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
load 'activation_energy.txt'
load 'plasma_parameter.txt'
load 'electron_density.txt'
load 'debey_radius.txt'
load 'critical_frequence_change.txt'
e = 1.602*10^-19
h = 6.626*10^-34
c = 3*10^8
nu_Delta = critical_frequence_change
n = electron_density
N_D = plasma_parameter
E0 = activation_energy.*e
E = activation_energy + h.*nu_Delta./e
lambda_De = debey_radius
s_O2 = (2*9.339e012-9.312e007)/10^12
s_N2 = (2*3.4711e+012-9.312e+007)/10^12
s_N2O = (3*4.0732e012 - 9.312e+007)/10^12
s_NO = (2*6.1824e+012 - 9.312e+007)/10^12
s_HNO2 = (2*3.4489e+013 - 9.312e+007)/10^12
s_CO2 = (2*6.9482e012 - 9.312e007)/10^12
lambda = (h*c)./(E0.*lambda_De.^3./n.*N_D).*10^4
sl_O2 = lambda.-s_O2
sl_N2 = lambda.-s_N2
sl_N2O = lambda.-s_N2O
sl_NO = lambda.-s_NO
sl_CO2 = lambda.-s_CO2
sl_HNO2 = lambda.-s_HNO2
plot(t,sl_O2,"r;O2;")
ishold
hold on
plot(t,sl_N2,"g;N2;")
plot(t,sl_N2O,"m;N2O;")
plot(t,sl_NO,"b;NO;")
plot(t,sl_CO2,"c;CO2;")
hold off
xlabel"Time interval [t/24 hrs.]"
ylabel"Wawelength's decay [e-17 m]"
print 'Wavelengths_decay_date.jpg','-dpng','-landscape','-FArial:18'
close
E_O2 = h*c./(sl_O2.*10^-17)./e.*n.^(3.5.*N_D./100)
E_N2 = h*c./(sl_N2.*10^-17)./e.*n.^(3.5.*N_D./100)
E_N2O = h*c./(sl_N2O.*10^-17)./e.*n.^(3.5.*N_D./100)
E_NO = h*c./(sl_NO.*10^-17)./e.*n.^(3.5.*N_D./100)
E_CO2 = h*c./(sl_CO2.*10^-17)./e.*n.^(3.5.*N_D./100)
plot(t,E_O2,"r;O2;")
ishold
hold on
plot(t,E_N2,"g;N2;")
plot(t,E_N2O,"m;N2O;")
plot(t,E_NO,"b;NO;")
plot(t,E_CO2,"c;CO2;")
plot(t,E,"b;Plasma energy;")
hold off
xlabel"Time interval [t/24 hrs.]"
ylabel"Energy levels [eV]"
print 'Plasma_spectrum_date.jpg','-dpng','-landscape','-FArial:18'
close 
E_all = [t E_O2 t E_N2 t E_N2O t E_NO t E_CO2 t E]
save -ascii plasma_spectrum.txt E_all
close