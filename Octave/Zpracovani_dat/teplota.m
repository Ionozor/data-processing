%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
load 'L.txt'
L1 = 0.1.*L
epsilon = 8.8542*10^-12
e = 1.602*10^-19
debeyova_delka
frekvence
load 'electron_density.txt'
n = electron_density
k_B = 1.38*10^-23
E_k = - (36*pi)^-2.*epsilon^-4/3.*n/e^-4
W_k = -E_k
E_k1 = E_k./e
W_k1 = -E_k1
T = W_k./k_B
T_el = T.*(n./lambda_De)
plot(t,T_el)
xlabel"Time interval [t/24 hrs.]"
ylabel"Plasma temperature [K]"
print 'Temperature_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii termodynamic_temperature.txt T_el
close
