%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 'x.txt'
load 'y.txt'
P0 = 10^-3
E_r = P0.*x.*10.^(y./10)
h = 6.626*10^-34
nu_r = 2.01*10^7
N = E_r./(h.*nu_r)
nu_i = 2.69*10^28
E_gamma = N.*h.*nu_i
plot(x,E_gamma)
xlabel "Time interval [t/24 hod.]"
ylabel "X-ray energy [J]"
print 'X_ray_energy_date.jpg','-dpng','-landscape','-FArial:18'
save -ascii bursts.txt E_gamma