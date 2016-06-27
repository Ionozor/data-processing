%Vojtěch Laitl 2016
%Ionozor group - VLF data analysis
t0 = data(1,:)
stringt = (1:columns(t))
t = (t0 + stept.*(stringt-1))'
t0 = ceil(H0./24.*rows(t))
t1 = floor(H1./24.*row(t))
t = t(,t0:t1)
nu0 = data(:,1)
stringnu = ((1:rows(nu)))'
nu = nu0 + stepnu.*(stringnu-1)
L0 = data(2:,t0:t1)
L = mean(L0,'g')
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
n_0 = (nu.^2*m_el*epsilon)/e^2
n = -1/4.*L1.^-4 + n_0
dn = [0 [diff(n)]]
n0 = 23400^2*epsilon*m_el/e^2
N = n-n0
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
save -hdf5 height_dependent_conc.h5 n_H
plot3(t,n_H,H)
axis('labely','labelz')
ylabel"dn/dL + dn/dH [1/m3]"
zlabel"Height [km]"
I0 = -26.74
R = 1.496*10^11
Is = exp(L./10)
fce = Is.*R.^2./I0
alpha = acos(fce)
x = abs(H.*tan(alpha))
drift = [t H x alpha]
save -hdf5 drift.h5 drift
T = [t t]
X = [x -x]
H1 = [H H]
mesh(T,X,H1)
axis('labely','labelz')
ylabel"Horizontal flow [km]"
zlabel"Height [km]"