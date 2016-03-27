%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
load 'L.txt'
vyska_ionosfery
load 'dn.txt' %tento soubor musí být upraven s počáteční nulou
load 'electron_density.txt'
n = electron_density
B = 10+(0.1.*L)
mD = 10^-10
n0 = omega^2*m_el*epsilon/e^2
N = n-n0
f_H = H.*(1-mD)./B
exp1 = exp(f_H./10^11)
exp2 = exp(-f_H./10^11)
f_B = (1-mD)./B
n_H = L.^-5 + 4.*N.*f_B.*(exp1 + exp2)
T = [t t]
H1 = [H H]
N_H = [((n_H+n)./n) ((n_H + n)./n)]
plot3(T,N_H,H1)
xlabel"Time [t/24 hrs.]"
ylabel"dn/dH + dn/dL [1/m3]"
zlabel"Height [km]"
print 'Ionogram_date.jpg','-dpng','-landscape','-FArial:18'
close
N_H1 = [n_H n_H]
plot3(T,N_H1,H1)
xlabel"Time [t/24 hrs.]"
ylabel"n'(H) + n'(L) [1/m3]"
zlabel"Height [km]"
print 'Gradients_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii ionogram.txt n_H
close