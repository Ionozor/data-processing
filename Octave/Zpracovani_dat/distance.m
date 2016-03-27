%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 'x.txt'
load 'y.txt'
d = (x.^2.*exp(y./10))./((x.^2+2).*log(10).*10.^(y./10))
l = exp(d./1020)
l_ly = l.*3.262
semilogy(x,l_ly)
xlabel"Time interval [t/24 hrs.]"
ylabel"Distance of ray burst [ly]"
print 'Ray_burst_distance.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii Distance.txt l_ly
close