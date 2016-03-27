%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
debeyova_delka
load 'electron_density.txt'
n = electron_density
teplota
plazmovy_parametr
aktivacni
U_i = E_a
N_A = 6.022*10^23
i_1 = 2.4*10^21.*T_el.^3/2.*exp((-U_i.*lambda_De)./(n.*N_D.^3.*k_B.*T_el))
i_2 = (2.4*10^21.*T_el.^3/2.*exp((-U_i.*lambda_De)./(n.*N_D.^3.*k_B.*T_el)).^3/4).^0.8584
i_avrg = (i_1+i_2)./2
I = [i_1 i_2 i_avrg]
plot(t,i_1,"b;Saha equation approach;")
ishold
hold on
plot(t,i_2,"g;Large-angle dispersion;")
plot(t,i_avrg,"r;Small-angle dispersion;")
hold off
xlabel"Time interval [t/24 hrs.]"
ylabel"Ionization degree" 
print 'Ionization_degree_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii ionization_degree.txt I
close