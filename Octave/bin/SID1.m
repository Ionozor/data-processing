%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
%Created by GNU Octave
localsid = num2str(DD)
localpath = [local B localsid]
cd(localpath)
t0 = data(1,:)
stringt = (1:columns(t))
t = (t0 + stept.*(stringt-1))'
nu0 = data(:,1)
stringnu = ((1:rows(nu)))'
nu = nu0 + stepnu.*(stringnu-1)
L0 = data(2:,2:)
L = mean(L0,'g')
%expecting the file format after reading by Octave as [time~0.5s frequency~10Hz relative intensity~0.001dB]
dt = [0 [diff(t)]]
L1 = 0.1.*L
n0 = -1/4.*L1.^-4
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
T = -E_k./k_B
lambda_De = sqrt((epsilon.*k_B.*T)./(n.*e^2))
save -hdf5 debye_radius.h5 lambda_De
p = [0 [diff(E_k)]]
nu_delta = p.*c./h
omega = nu_delta + nu
save -hdf5 frequency.h5 omega
n_0 = (nu.^2*m_el*epsilon)/e^2
n = -1/4.*L1.^-4 + n_0
save -hdf5 electron_density.h5 n
dn = [0 [diff(n)]]
T_el = T.*(n./lambda_De)
save -hdf5 temperature.h5 T_el
N_D = 4/3*pi.*lambda_De.*n
save -hdf5 plasma_parameter.h5 N_D
W_k = (3/2*k_B.*T_el)./e
save -hdf5 kinetic_energy.h5 W_k
p_el = [0 [diff(W_k)]]
save -hdf5 linear_momentum.h5 p_el
W_p = (2.*W_k)./(9.*N_D.^2/3)
save -hdf5 potential_energy.h5 W_p
v = (3*k_B.*T_el./(n.*m_el)).^1/2 .* lambda_De
save -hdf5 mean_q_velocity.h5 v
ac = [0 [diff(v)]]
save -hdf5 acceleration.h5 ac
s = (2*k_B.*T_el.^3./(n.*m_el)).^1/2 .*lambda_De.^3
save -hdf5 fluctuation_scope.h5 s
A0 = ((dn.+n)./n)./(1000*N_A)
B0 = R.*T
E_a = abs(-log(A0.^B0))./e + h*1.21567*10^-7/e
save -hdf5 activation_energy.h5 E_a
U_i = E_a.*e
i_1 = 2.4*10^21.*T_el.^3/2.*exp((-U_i.*lambda_De)./(n.*N_D.^3.*k_B.*T_el))
i_2 = (2.4*10^21.*T_el.^3/2.*exp((-U_i.*lambda_De)./(n.*N_D.^3.*k_B.*T_el)).^3/4).^0.8584
i_avrg = (i_1+i_2)./2
i_all = [i_1 i_1 i_avrg]
save -hdf5 ionization_degree.h5 i_all
n_0 = 23400^2*epsilon*m_el/e^2
N = n-n_0
Bl = 1+(0.01.*L)
mD = 10^-10
h0 = abs(pi*i.*Bl./(2+2.*mD))
h0_t = (10.*h0).^2./10
f_n = dn.*Bl./(N.*(1-mD))
f_n2 = f_n.^2
f_ln = log(1/2.*f_n-((f_n2.^2 - 4).^1/2))
h_t = abs((Bl.*f_ln + 2.*pi.*i)./(1-mD))
H = 10.*(h0_t + h_t)
save -hdf5 height.h5 H
Bl1 = 10+(0.1.*L)
f_H = H.*(1-mD)./Bl1
exp1 = exp(f_H./10^11)
exp2 = exp(-f_H./10^11)
f_B = (1-mD)./Bl1
n_H = L.^-5 + 4.*N.*f_B.*(exp1 + exp2)
save -hdf5 height_dependent_TEC.h5 n_H
p = h0.*(mD-1)
p1 = H.*(1-mD) + pi
n_el = 10.*(exp((2.*N_D./1000.*(p1-p) + Bl)./Bl) + 4.*H)
n_el1 = n_el./10^6
T_e = 3^2/3.*e^2.*n_el.^1/3.*N_D.^2/3./(epsilon*k_B*(4*pi)^2/3).*lambda_De.^1.2
n_e = 10.*(exp((2.*N_D./1000000.*(p1-p) + Bl)./Bl) + 4.*H)
n_e1 = n_e./10^6
T_EL = 3^2/3.*e^2.*n_e.^1/3.*N_D.^2/3./(epsilon*k_B*(4*pi)^2/3).*lambda_De.^1.2
lambda_M = (h*c.*lambda_De.^(N_D./100))./(k_B.*T_e)
lambda_S = (h*c.*lambda_De.^(N_D./100))./(k_B.*T_EL)
f_nh = (-2.*H.*(mD-1) + h0_t.*(-mD) + h0_t + pi)./B
f_exp = exp(f_nh)
f_T = (-2^4/3.*(mD-1).*N.*(1-mD).*log10(2.71818281).*f_exp)./(3.*B.^2.*N.*(1-mD).*f_exp)
dT = 3^2/3.*e^2.*N_D.^2/3./(epsilon.*k_B.*(4*pi)^2/3).*lambda_De.^6/5.*f_T
dTe = [0 [diff(T_e)]]
Z = -1./dTe.*dT
f1 = n_el.*E_a.*e./Z
f2 = k_B.*T_e
f_I = f1.*f2.*exp(-T_el./T_e)
I = abs(log(f_I))
save -hdf5 intensity.h5 I
E = E_a + h.*nu_Delta./e
s_O2 = (2*9.339e012-9.312e007)/10^12
s_N2 = (2*3.4711e+012-9.312e+007)/10^12
s_N2O = (3*4.0732e012 - 9.312e+007)/10^12
s_NO = (2*6.1824e+012 - 9.312e+007)/10^12
s_CO2 = (2*6.9482e012 - 9.312e007)/10^12
lambda = (h*c)./(E_a.*e.*lambda_De.^3./n.*N_D).*10^4
sl_O2 = lambda.-s_O2
sl_N2 = lambda.-s_N2
sl_N2O = lambda.-s_N2O
sl_NO = lambda.-s_NO
sl_CO2 = lambda.-s_CO2
E_O2 = h*c./(sl_O2.*10^-17)./e.*n.^(3.5.*N_D./100)
E_N2 = h*c./(sl_N2.*10^-17)./e.*n.^(3.5.*N_D./100)
E_N2O = h*c./(sl_N2O.*10^-17)./e.*n.^(3.5.*N_D./100)
E_NO = h*c./(sl_NO.*10^-17)./e.*n.^(3.5.*N_D./100)
E_CO2 = h*c./(sl_CO2.*10^-17)./e.*n.^(3.5.*N_D./100)
E_all = [E_O2 E_N2 E_N2O E_NO E_CO2 E]
save -hdf5 plasma_spectrum.h5 E_all
C_e = gamma.*n.*T_el
save -hdf5 specific_calorific_capacity.h5 C_e
Q = C_e.*m_el.*T./e
save -hdf5 heat.h5 Q
dQ = [0 [diff(Q)]]
S = dQ./T_el
save -hdf5 termodynamic_entropy.h5 S
T = 10.*abs(log(b./lambda_M))
save -hdf5 effective_temperature_meteors.h5 T
dTe1 = [0 [diff(T)]
lambda = b./T
save -hdf5 wavelenghts_meteor.h5 lambda
Z = log(((1.5*R_inf.*sqrt(3*R_inf*c./lambda))./(1.5*R_inf)))-9
save atoms_meteors_DHO38.dat Z
dT = abs(10.*(log(T)))
n = (16.*epsilon^3.*k_B^3.*pi^2.*lambda_De.^1.5.*exp(dT./(0.1.*N_D)))./(9.*e^6.*N_D.^2)
Z = -1./dTe1.*dT
f1 = n.*E_a.*e./Z
f2 = k_B.*T
f_I = f1.*f2.*exp(-T_el./T)
IM = abs(log(f_I))
save -hdf5 intensity_meteors.h5 IM
save -hdf5 electron_density_meteors.h5 n
dTS = 10.*abs(log(b./lambda_S))
TS = exp(dTS./10)
save -hdf5 temperature_solar.h5 TS
nS = (16.*epsilon^3.*k_B^3.*pi^2.*lambda_De.^1.5.*TS)./(9.*e^6.*N_D.^2)
save -hdf5 electron_density_solar.h5 nS
dTS = [0 [diff(TS)]]
Z = -1./dTS.*dT
f1 = n_el.*E_a.*e./Z
f2 = k_B.*TS
f_I = f1.*f2.*exp(-T_el./TS)
IS = abs(log(f_I))
save -hdf5 intensity_solar.h5 I
lambdas = b./TS
save -hdf5 wavelenghts_sun.h5 lambda_S
ZS = abs(log(((1.5*R_inf.*sqrt(3*R_inf*c./lambdas))./(1.5*R_inf))) - 29)
save -hdf5 atoms_solar.h5 ZS
I0 = -26.74
R = 1.496*10^11
Is = exp(L./10)
fce = Is.*R.^2./I0
alpha = acos(fce)
save -hdf5 fallout_angle.h5 alpha
x = abs(H.*tan(alpha))
save -hdf5 horizontal_drift.h5 x
tau = (dt.+t)./t 
F = E_a.*e./(tau.*n)
save -hdf5 x_ray_flux.h5 F
F_V = F./(lambda_De.*e)
save -hdf5 x_ray_flux_debye_sphere.h5 F_V
