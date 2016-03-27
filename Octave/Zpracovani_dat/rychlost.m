%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
debeyova_delka
load 'electron_density.txt'
n = electron_density
teplota
k_B = 1.38*10^-23
m_el = 9.109*10^-31 
v = (3*k_B.*T_el./(n.*m_el)).^1/2 .* lambda_De
plot(t,v)
xlabel"Time interval [t/24 hrs.]"
ylabel"Electron's velocity [m/s]"
print 'Velocity_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii velocity.txt v
close
acceleration = diff(v) %symbolické řešení derivace; nutno do souboru připsat první řádek s nulou
save -ascii zrychleni.txt acceleration
close