%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 'zrychleni.txt' %nutno, aby tento soubor byl už upraven
load 't.txt'
plot(t,zrychleni)
xlabel"Time interval [t/24 hrs.]"
ylabel"Electron's acceleration [m/s2]"
print 'Acceleration_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii acceleration.txt zrychleni
close