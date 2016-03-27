%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
aktivacni
E = E_a
load dt.txt %načítá upravený soubor
load 'electron_density.txt'
n = electron_density
tau = (dt.+t)./t %symbolicky řeší úplnou derivaci, proto nutný stejný rozměr matic
F = E./(tau.*n)
plot(t,F)
xlabel"Casovy interval [t/24 hrs.]"
ylabel"Zarivy tok [W/m2]"
print 'X_ray_flux_date.jpg','-dpng','-landscape','-FArial:18'
close
F_V = F./(lambda_De.*e)
plot(t,F_V)
xlabel"Time interval [t/24 hrs.]"
ylabel"X-ray flux in Debye sphete [eV/m2*s]"
print 'X_ray_flux_Debey_sphere_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii X_ray_flux_Debye_sphere.txt F_V
close