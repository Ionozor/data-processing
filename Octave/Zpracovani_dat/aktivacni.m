%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
load 'electron_density.txt'
n = electron_density
load 'dn.txt' %načíst upravený soubor
N_A = 6.022*10^23
h = 6.626*10^-34
a = ((dn.+n)./n)./(1000*N_A)
R = 8.314
teplota
b = R.*T
E_a = abs(-log(a.^b))
e = 1.602*10^-19
E_a2 = E_a./e
plot(t,E_a2)
xlabel"Time interval [t/24 hrs.]"
ylabel"Ionization's energy level [eV]"
print 'Energy_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii activation_energy.txt E_a2
lambda_Ly = 1.21567*10^-7
c = 3*10^8
nu_Ly = c/lambda_Ly
nu_i = (E_a./h) .- nu_Ly
save -ascii ionization_frequence.txt nu_i
plot(t,nu_i)
xlabel"Casovy interval [t/24 hrs.]"
ylabel"Gamma photons' frequence [Hz]"
print 'Frequence_gamma_date.jpg','-dpng','-landscape','-FArial:18'
close