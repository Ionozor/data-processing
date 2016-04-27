load t.txt
load L.txt
load height.txt
H = height
I0 = -26.74
R = 1.496*10^11
I = exp(L./10)
fce = I.*R.^2./I0
alpha = acos(fce)
x = abs(H.*tan(alpha))
plot(t,x)
xlabel"Time interval [t/24 hrs.]"
ylabel"Horizontal flow [km]"
print 'Horizontal_flow_date.jpg','-dpng','-landscape','-FArial:18'
close
T = [t t]
X = [x -x]
H1 = [H H]
mesh(T,X,H1)
xlabel"Time interval [t/24 hrs.]"
ylabel"Horizontal flow [km]"
zlabel"Height [km]"
print 'Vertical_distribution_date.jpg','-dpng','-landscape','-FArial:18'
close
mesh(T,H1,X)
xlabel"Time interval [t/24 hrs.]"
ylabel"Height [km]"
zlabel"Horizontal flow [km]"
print 'Horizontal_distribution_date.jpg','-dpng','-landscape','-FArial:18'
close
save -ascii Horizontal_flow.txt x
close