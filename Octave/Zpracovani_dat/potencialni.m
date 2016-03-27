%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
load 'kinetic_work.txt'
W_k = kinetic_work
load 'plasma_parameter.txt'
N_D = plasma_parameter
W_p1 = (2.*W_k)./(9.*N_D.^2/3)
plot(t,W_p1)
xlabel"Time interval [t/24 hrs.]"
ylabel "Potential energy [eV]"
print 'Potential_energy_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii potential_work.txt W_p
close