%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
load 'hybnost_el.txt' %soubor musí už být upraven
c = 3*10^8
h = 6.626*10^-34
nu_Delta = hybnost_el.*c./h
nu = 23400 + nu_Delta %počáteční frekvence pro DHO38_Ampl
plot(t,nu)
xlabel"Time interval [t/24 hrs.]"
ylabel"Electron plasma frequence [Hz]"
print 'Critical_frequence_change_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii critical_frequence_change.txt nu_Delta
close
