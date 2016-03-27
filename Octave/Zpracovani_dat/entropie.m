%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
load 'dQ.txt'
teplota
S = dQ./T_el
semilogy(t,S)
xlabel"Time interval [t/24 hrs.]"
ylabel"Termodynamic entropy [eV/K]"
print 'Entropy_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii termodynamic_entropy.txt S
close