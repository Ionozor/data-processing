%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
load 't.txt'
load 'L.txt'
L1 = 0.1.*L
epsilon = 8.8542*10^-12
e = 1.602*10^-19
n = -1/4.*L1.^-4
k_B = 1.38*10^-23
E_k = - (36*pi)^-2.*epsilon^-4/3.*n./e^-4
W_k = -E_k
E_k1 = E_k./e
W_k1 = -E_k1
T = W_k./k_B %celý tento kód jen řeší derivaci, proto nic neukládá ani nevytváří obrázek
