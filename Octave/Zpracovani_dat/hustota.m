%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
load 'L.txt'
frekvence
e = 1.602*10^-19
epsilon = 8.854*10^-12
m_el = 9.109*10^-31
omega = 2.34*10^4
nu = omega + nu_Delta
n_0 = (nu.^2*m_el*epsilon)/e^2
L1 = 0.1.*L
n = -1/4.*L1.^-4 + n_0
plot(t,n)
xlabel"Time interval [t/24 hrs.]"
ylabel"Electron density [1/m3]"
print 'Electron_density_date.jpg','-dpng','-landscape','-FArial:18'
save -ascii electron_density.txt n
dn = diff(n)
save -ascii dn.txt dn %symbolické řešení derivace; do souboru nutno připsat první řádek s nulou