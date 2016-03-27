%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
debeyova_delka
load 'electron_density.txt'
n = electron_density
teplota
k_B = 1.38*10^-23
m_el = 9.109*10^-31
s = (2*k_B.*T_el.^3./(n.*m_el)).^1/2 .*lambda_De.^3
plot(t,s)
xlabel"Casovy iterval [t/24 hrs.]"
ylabel"Fluctuation scope [m]"
print 'Scope_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii scope.txt s
close