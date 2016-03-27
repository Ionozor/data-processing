%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
load 'electron_density.txt'
n = electron_density
zarivy_tok %3D graf zářivého toku pomocí příkazu mesh
F0 = (t.^-5 - e.^1./(t-5) + 6.755*10^-3)./n
T = [t t]
F = [F_V F_V]
N = [n n]
plot3(T,N,F)
xlabel"Time [t/24 hod.]"
ylabel"n [1/m3]"
zlabel"X-ray flux in Debye sphere [eV/m2*s]"
print 'X-ray_flux_effects_date.jpg','-dpng','-landscape','-FArial:18'
close