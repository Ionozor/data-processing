%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt' %derivuje čas pro další výpočet
dt = diff(t)
save -ascii dt.txt dt
close 