%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 'x.txt' %radioteleskop - časový údaj
load 'y.txt' %radioteleskop - signál
plot(x,y,'r;Radio telescope;')
xlabel "Time interval [t/24 hrs.]"
ylabel "Radio signal intensity level [dB]"
print 'Radiotelescope_date.jpg','-dpng','-landscape','-FArial:18'