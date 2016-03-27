%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
teplota
plazmovy_parametr
k_B = 1.38*10^-23
W_k = (3/2*k_B.*T_el)./e
plot(t,W_k)
xlabel"Time interval [t/24 hrs.]"
ylabel"Kinetic energy [eV]"
print 'Kinetic_energy_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii kinetic_work.txt W_k
close
W_p = (2.*W_k)./(9.*N_D.^2/3)
save -ascii potential_work.txt W_p
close
p_el = diff(W_k)
save -ascii hybnost.txt p_el %v textovém souboru se opět musí připsat na začátek nula...