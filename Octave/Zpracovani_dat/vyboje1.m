%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt' %kód pro počítač Ostrov
load 'L.txt' %načítá příslušná data ze splitteru
load 't0.txt' %tento model prosím neměnit
load 'L0.txt' %tento model prosím neměnit
L1 = L0 + 10
X = [t t]
Y = [L L]
Z = [L (-1/4.*((L./10).^-4))]
X0 = [t0;t0]
Y1 = [L1;L1]
Z1 = [L1;(-1/4.*((L1./10).^-4))]
mesh(X,Z,Y)
ishold
hold on
mesh(X0,Z1,Y1)
hold off
xlabel"Time interval [t/24 hrs.]"
ylabel"L [dB]"
zlabel"dn/dL [1/m3]"
print 'Discharges_date.jpg','-dpng','-landscape','-FArial:18'
close