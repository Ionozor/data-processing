%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
debeyova_delka
load 'electron_density.txt'
n = electron_density
N_D = 4/3*pi.*lambda_De.*n
plot(t,N_D)
xlabel"Time interval [t/24 hrs.]"
ylabel"Plasma parameter"
print 'Plasma_parameter_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii plasma_parameter.txt N_D
close