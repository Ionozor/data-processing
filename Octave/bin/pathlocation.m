path0 = pwd
[YY MM DD] = datevec(date)
DD = DD-1
if MM < 10
m = 0
else
m = []
endif
if DD < 10
d = 0
else
d = []
endif
A = "space.astro.cz/ionozor/VLF/VLFOSTROV/R1"
A1 = "space.astro.cz/ionozor/VLF/HFKVARY/R2"
A2 = "space.astro.cz/ionozor/VLF/HFKVARY/SOKOLOV-R1"
B = "/"
C = num2str(YY)
D = "/"
E = num2str(MM)
F = "/"
G = num2str(DD)
H1 = "/t.txt"
H2 = "/L.txt"
Ip = num2str(m)
J = num2str(d)
path01 = [A B C D Ip E F J G H1]
path02 = [A B C D Ip E F J G H2]
t = urlread(path01);
L = urlread(path02);
a = "ionozor/VLF/VLFOSTROV/R1/"
b = num2str(YY)
c = num2str(MM)
local = [a b D Ip c]
cd (local)
mkdir(num2str(DD))
cd (num2str(DD))
save -ascii t.txt t
save -ascii L.txt L
cd(path0)
SID
path11 = [A1 B C D Ip E F J G H1]
path12 = [A1 B C D Ip E F J G H2]
t = urlread(path11);
L = urlread(path12);
a = "ionozor/VLF/HFKVARY/R2/"
b = num2str(YY)
c = num2str(MM)
local = [a b D Ip c]
cd (local)
mkdir(num2str(DD))
cd (num2str(DD))
save -ascii t.txt t
save -ascii L.txt L
cd(path0)
SID
path21 = [A2 B C D Ip E F J G H1]
path22 = [A2 B C D Ip E F J G H2]
t = urlread(path21);
L = urlread(path22);
a = "ionozor/VLF/HFKVARY/SOKOLOV-R1/"
b = num2str(YY)
c = num2str(MM)
local = [a b D Ip c]
cd (local)
mkdir(num2str(DD))
cd (num2str(DD))
save -ascii t.txt t
save -ascii L.txt L
cd(path0)
SID
