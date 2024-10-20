clc
clear

fileID = fopen('mesh\info.geo','r');


l = fgetl(fileID);
if l(1) == 'd'
   c = split(l);
   X = str2double(c{2});
   Y = str2double(c{3});
end
n = X*Y;
Xmesh1 = zeros(Y,X);
Ymesh1 = zeros(Y,X);
for j = 1:Y
    for i = 1:X
        l = fgetl(fileID);
        c = split(l);
        Xmesh1(end+1-j,i) = str2double(c{2});
        Ymesh1(end+1-j,i) = str2double(c{3});
    end
end


Xmesh = Xmesh1;
Ymesh = Ymesh1;

save mesh Xmesh Ymesh