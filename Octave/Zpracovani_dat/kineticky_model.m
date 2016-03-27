%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt' %načte rozdělené hodnoty ze splitteru, tedy čas v souboru t.txt a signál ze souboru L.txt
load 'L.txt' %v dalších kódech zachovávám tato označení
L1 = 0.1.*L
n = -1/4.*L1.^-4
epsilon = 8.8542*10^-12
e = 1.602*10^-19
k_B = 1.38*10^-23
E_k = - (36*pi)^-2.*epsilon^-4/3.*n/e^-4
E_k1 = E_k./e
p = diff(E_k)
close
save -ascii hybnost_el.txt p %symbolické řešení úplné derivace - v souboru hybnost_el.txt nutno následně připsat počáteční řádek s nulou
close
