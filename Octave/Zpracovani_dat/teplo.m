%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
load 'L.txt'
L1 = 0.1.*L
load 'electron_density.txt'
n = electron_density
teplota
m_e = 9.109*10^-31
gamma = 10^-3
e = 1.602*10^-19
c_e = gamma.*n.*T_el
c_eV = c_e./e
plot(t,c_eV)
xlabel"Time interval [t/24 hrs.]"
ylabel"Specific calorific capacity [eV/(kg*K)]"
print 'Specific_calorific_capacity_date.jpg','-dpng','-landscape','-FArial:18'
close 
save -ascii specific_calorific_capacity.txt c_eV
Q = c_e.*m_e.*T
Q_eV = Q./e
semilogy(t,Q_eV)
xlabel"Time interval [t/24 hod.]"
ylabel"Heat [eV]"
print 'Heat_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii heat.txt Q_eV
close
dQ = diff(Q_eV)
save -ascii dQ.txt dQ %nutno připsat do souboru úvodní řádek s nulou 
