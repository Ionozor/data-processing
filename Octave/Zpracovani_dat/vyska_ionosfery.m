%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
load 'L.txt'
frekvence
load 'electron_density.txt'
n = electron_density
e = 1.602*10^-19
omega = 23400
epsilon = 8.854*10^-12
m_el = 9.109*10^-31
k_B = 1.38*10^-23
load dn.txt %načítá upravený soubor s nulou
n0 = omega^2*epsilon*m_el/e^2
N = n-n0
B = 1+(0.01.*L)
mD = 10^-10
h0 = abs(pi*i.*B./(2+2.*mD))
h0_t = (10.*h0).^2./10
f_n = dn.*B./(N.*(1-mD))
f_n2 = f_n.^2
f_ln = log(1/2.*f_n-((f_n2.^2 - 4).^1/2))
h_t = abs((B.*f_ln + 2.*pi.*i)./(1-mD))
H = 10.*(h0_t + h_t)
plot(t,H)
xlabel"Time interval [t/24 hrs.]"
ylabel"Height [km]"
print 'Height_date.jpg','-dpng','-landscape','-FArial:18'
close
figure(); stem(t,H);
xlabel"Time interval [t/24 hrs.]"
ylabel"Height [km]"
print 'Height2_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii height.txt H
close