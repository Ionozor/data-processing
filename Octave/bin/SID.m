%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
%Created by GNU Octave
dt = [0;[diff(t)]]
L1 = 0.1.*L
n = -1/4.*L1.^-4
epsilon = 8.8542*10^-12
e = 1.602*10^-19
k_B = 1.38*10^-23
gamma = 10^-3
R_inf = 3.2899*10^15
c = 3*10^8
b = 2.898*10^-3
h = 6.626*10^-34
m_el = 9.109*10^-31
R = 8.314
N_A = 6.022*10^23
E_k = - (36*pi)^-2.*epsilon^-4/3.*n/e^-4
p = [0;[diff(E_k)]]
nu_Delta = p.*c./h
nu = 23400 + nu_Delta 
%DHO 38 band
%Possible for every band which is determined before. E.g. nu = nu_Delta + ["DHO38" "NAA" "GBZ" ...].
save -ascii critical_frequency_DHO38.txt nu
n_0 = (nu.^2*m_el*epsilon)/e^2
n = -1/4.*L1.^-4 + n_0
save -ascii electron_density_DHO38.txt n
dn = [0; [diff(n)]
T = -E_k1./k_B
lambda_De = sqrt((epsilon.*k_B.*T)./(n.*e^2))
save -ascii debye_radius_DHO38.txt lambda_De
T_el = T.*(n./lambda_De)
save -ascii termodynamic_temperature_DHO38.txt T_el
N_D = 4/3*pi.*lambda_De.*n
save -ascii plasma_parameter_DHO38.txt N_D
W_k = (3/2*k_B.*T_el)./e
save -ascii kinetic_energy_DHO38.txt W_k
p_el = [0;[diff(W_k)]]
save -ascii linear_momentum_DHO38.txt p_el
W_p = (2.*W_k)./(9.*N_D.^2/3)
save -ascii potential_energy_DHO38.txt W_p1
v = (3*k_B.*T_el./(n.*m_el)).^1/2 .* lambda_De
save -ascii mean_q_velocity_DHO38.txt v
a = [0;[diff(v)]]
save -ascii acceleration_DHO38.txt a
s = (2*k_B.*T_el.^3./(n.*m_el)).^1/2 .*lambda_De.^3
save -ascii fluctuation_scope_DHO38.txt s
A = ((dn.+n)./n)./(1000*N_A)
B = R.*T
E_a = abs(-log(A.^B))./e + h*1.21567*10^-7/e
save -ascii activation_energy_DHO38.txt E_a
U_i = E_a.*e
i_1 = 2.4*10^21.*T_el.^3/2.*exp((-U_i.*lambda_De)./(n.*N_D.^3.*k_B.*T_el))
i_2 = (2.4*10^21.*T_el.^3/2.*exp((-U_i.*lambda_De)./(n.*N_D.^3.*k_B.*T_el)).^3/4).^0.8584
i_avrg = (i_1+i_2)./2
i_all = [i_1 i_1 i_avrg]
save -ascii ionization_degree_DHO38.txt i_all
n_0 = omega^2*epsilon*m_el/e^2
N = n-n0
B = 1+(0.01.*L)
mD = 10^-10
h0 = abs(pi*i.*B./(2+2.*mD))
h0_t = (10.*h0).^2./10
f_n = dn.*B./(N.*(1-mD))
f_n2 = f_n.^2
f_ln = log(1/2.*f_n-((f_n2.^2 - 4).^1/2))
h_t = abs((B.*f_ln + 2.*pi.*i)./(1-mD))
H = 10.*(h0_t + h_t)
save -ascii height_DHO38.txt H
B1 = 10+(0.1.*L)
f_H = H.*(1-mD)./B1
exp1 = exp(f_H./10^11)
exp2 = exp(-f_H./10^11)
f_B = (1-mD)./B1
n_H = L.^-5 + 4.*N.*f_B.*(exp1 + exp2)
save -ascii height_dependent_TEC_DHO38.txt n_H
p = h0.*(mD-1)
p1 = H.*(1-mD) + pi
n_el = 10.*(exp((2.*N_D./1000.*(p1-p) + B)./B) + 4.*H)
n_el1 = n_el./10^6
T_e = 3^2/3.*e^2.*n_el.^1/3.*N_D.^2/3./(epsilon*k_B*(4*pi)^2/3).*lambda_De.^1.2
n_e = 10.*(exp((2.*N_D./1000000.*(p1-p) + B)./B) + 4.*H)
n_e1 = n_e./10^6
T_EL = 3^2/3.*e^2.*n_e.^1/3.*N_D.^2/3./(epsilon*k_B*(4*pi)^2/3).*lambda_De.^1.2
lambda_M = (h*c.*lambda_De.^(N_D./100))./(k_B.*T_e)
lambda_S = (h*c.*lambda_De.^(N_D./100))./(k_B.*T_EL)
f_nh = (-2.*H.*(mD-1) + h0_t.*(-mD) + h0_t + pi)./B
f_exp = exp(f_nh)
f_T = (-2^4/3.*(mD-1).*N.*(1-mD).*log10(2.71818281).*f_exp)./(3.*B.^2.*N.*(1-mD).*f_exp)
dT = 3^2/3.*e^2.*N_D.^2/3./(epsilon.*k_B.*(4*pi)^2/3).*lambda_De.^6/5.*f_T
dTe = [0;[diff(T_e)]]
Z = -1./dTe.*dT
f1 = n_el.*E_a./Z
f2 = k_B.*T_e
f_I = f1.*f2.*exp(-T_el./T_e)
I = abs(log(f_I))
save -ascii intensity.txt I
E = activation_energy + h.*nu_Delta./e
s_O2 = (2*9.339e012-9.312e007)/10^12
s_N2 = (2*3.4711e+012-9.312e+007)/10^12
s_N2O = (3*4.0732e012 - 9.312e+007)/10^12
s_NO = (2*6.1824e+012 - 9.312e+007)/10^12
s_CO2 = (2*6.9482e012 - 9.312e007)/10^12
sl_HNO2 = lambda.-s_HNO2
lambda = (h*c)./(E_a.*e.*lambda_De.^3./n.*N_D).*10^4
sl_O2 = lambda.-s_O2
sl_N2 = lambda.-s_N2
sl_N2O = lambda.-s_N2O
sl_NO = lambda.-s_NO
sl_CO2 = lambda.-s_CO2
sl_HNO2 = lambda.-s_HNO2
E_O2 = h*c./(sl_O2.*10^-17)./e.*n.^(3.5.*N_D./100)
E_N2 = h*c./(sl_N2.*10^-17)./e.*n.^(3.5.*N_D./100)
E_N2O = h*c./(sl_N2O.*10^-17)./e.*n.^(3.5.*N_D./100)
E_NO = h*c./(sl_NO.*10^-17)./e.*n.^(3.5.*N_D./100)
E_CO2 = h*c./(sl_CO2.*10^-17)./e.*n.^(3.5.*N_D./100)
E_all = [t E_O2 t E_N2 t E_N2O t E_NO t E_CO2 t E]
save -ascii plasma_spectrum_DHO38.txt E_all
tau = (dt.+t)./t
F = E_a.*e./(tau.*n)
save -ascii x_ray_flux_DHO38.txt F
F_V = F./(lambda_De.*e)
save -ascii x_ray_flux_in_debye_sphere_DHO38.txt F_V
C_e = gamma.*n.*T_el
save -ascii specific_calorific_capacity_DHO38.txt C_e
Q = C_e.*m_el.*T./e
save -ascii heat_DHO38.txt Q
dQ = [0;[diff(Q)]]
S = dQ./T_el
save -ascii termodynamic_entropy.txt S
T = 10.*abs(log(b./lambda_M))
save -ascii effective_temperature_meteors_DHO38.txt T
lambda = b./T
save -ascii wavelenghts_meteor_DHO38.txt lambda
Z = log(((1.5*R_inf.*sqrt(3*R_inf*c./Lambda))./(1.5*R_inf)))-9
save -ascii atoms_meteors_DHO38.txt Z
dT = abs(10.*(log(T)))
n = (16.*epsilon^3.*k_B^3.*pi^2.*lambda_De.^1.5.*exp(dT./(0.1.*N_D)))./(9.*e^6.*N_D.^2)
save -ascii electron_density_meteors_DHO38.txt n
dTS = 10.*abs(log(b./lambda_S))
TS = exp(dTS./10)
save -ascii temperature_solar_DHO38.txt TS
nS = (16.*epsilon^3.*k_B^3.*pi^2.*lambda_De.^1.5.*TS)./(9.*e^6.*N_D.^2)
save -ascii electron_density_solar_DHO38.txt nS
lambdas = b./TS
save -ascii wavelenghts_sun_DHO38.txt lambda_S
ZS = abs(log(((1.5*R_inf.*sqrt(3*R_inf*c./lambdas))./(1.5*R_inf))) - 29)
save -ascii atoms_solar_DHO38.txt ZS
I0 = -26.74
R = 1.496*10^11
Is = exp(L./10)
fce = Is.*R.^2./I0
alpha = acos(fce)
x = abs(H.*tan(alpha))
save -ascii horizontal_drift_DHO38.txt x
