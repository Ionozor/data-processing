%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
teplotni_zmena
epsilon = 8.854*10^-12
k_B = 1.38*10^-23
e = 1.602*10^-19
lambda_De = sqrt((epsilon.*k_B.*T)./(n.*e^2))
plot(t,lambda_De)
ylabel"Debye radius [m]"
xlabel"Time interval [t/24 hrs.]"
print 'Debye_radius_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii debey_radius.txt lambda_De
close