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
Ep = num2str(MM)
F = num2str(DD)
sid = "sid"
format = ".h5"
%working with a standard -hdf5 friendyl format
G = "[sid YY MM DD format]"
Ip = num2str(m)
J = num2str(d)
path01 = [A B C B Ip Ep B J F B G]
path11 = [A1 B C B Ip Ep B J F B G]
path21 = [A2 B C B Ip Ep B J F B G]
%e.g. path01 = space.astro.cz/ionozor/VLF/2020/05/12/sid20200512.h5
data = urlread(path01);
a = "ionozor/VLF/VLFOSTROV/R1/"
b = num2str(YY)
c = num2str(MM)
local = [a b B Ip c]
cd(path0)
cd (local)
mkdir(num2str(DD))
cd (num2str(DD))
SID1
data = urlread(path11);
a = "ionozor/VLF/HFKVARY/R2/"
b = num2str(YY)
c = num2str(MM)
local = [a b B Ip c]
cd(path0)
cd (local)
mkdir(num2str(DD))
cd (num2str(DD))
cd(path0)
SID1
data = urlread(path21);
a = "ionozor/VLF/HFKVARY/SOKOLOV-R1/"
b = num2str(YY)
c = num2str(MM)
local = [a b B Ip c]
cd (local)
mkdir(num2str(DD))
cd (num2str(DD))
cd(path0)
SID1
