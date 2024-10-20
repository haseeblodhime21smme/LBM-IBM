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


l = fgetl(fileID);
if l(1) == 'd'
   c = split(l);
   X = str2double(c{2});
   Y = str2double(c{3});
end
n = X*Y;
Xmesh2 = zeros(Y,X);
Ymesh2 = zeros(Y,X);
for j = 1:Y
    for i = 1:X
        l = fgetl(fileID);
        c = split(l);
        Xmesh2(end+1-j,i) = str2double(c{2});
        Ymesh2(end+1-j,i) = str2double(c{3});
    end
end



l = fgetl(fileID);
if l(1) == 'd'
   c = split(l);
   X = str2double(c{2});
   Y = str2double(c{3});
end
n = X*Y;
Xmesh3 = zeros(Y,X);
Ymesh3 = zeros(Y,X);
for j = 1:Y
    for i = 1:X
        l = fgetl(fileID);
        c = split(l);
        Xmesh3(end+1-j,i) = str2double(c{2});
        Ymesh3(end+1-j,i) = str2double(c{3});
    end
end




l = fgetl(fileID);
if l(1) == 'd'
   c = split(l);
   X = str2double(c{2});
   Y = str2double(c{3});
end
n = X*Y;
Xmesh4 = zeros(Y,X);
Ymesh4 = zeros(Y,X);
for j = 1:Y
    for i = 1:X
        l = fgetl(fileID);
        c = split(l);
        Xmesh4(end+1-j,i) = str2double(c{2});
        Ymesh4(end+1-j,i) = str2double(c{3});
    end
end




l = fgetl(fileID);
if l(1) == 'd'
   c = split(l);
   X = str2double(c{2});
   Y = str2double(c{3});
end
n = X*Y;
Xmesh5 = zeros(Y,X);
Ymesh5 = zeros(Y,X);
for j = 1:Y
    for i = 1:X
        l = fgetl(fileID);
        c = split(l);
        Xmesh5(end+1-j,i) = str2double(c{2});
        Ymesh5(end+1-j,i) = str2double(c{3});
    end
end



l = fgetl(fileID);
if l(1) == 'd'
   c = split(l);
   X = str2double(c{2});
   Y = str2double(c{3});
end
n = X*Y;
Xmesh6 = zeros(Y,X);
Ymesh6 = zeros(Y,X);
for j = 1:Y
    for i = 1:X
        l = fgetl(fileID);
        c = split(l);
        Xmesh6(end+1-j,i) = str2double(c{2});
        Ymesh6(end+1-j,i) = str2double(c{3});
    end
end



l = fgetl(fileID);
if l(1) == 'd'
   c = split(l);
   X = str2double(c{2});
   Y = str2double(c{3});
end
n = X*Y;
Xmesh7 = zeros(Y,X);
Ymesh7 = zeros(Y,X);
for j = 1:Y
    for i = 1:X
        l = fgetl(fileID);
        c = split(l);
        Xmesh7(end+1-j,i) = str2double(c{2});
        Ymesh7(end+1-j,i) = str2double(c{3});
    end
end



l = fgetl(fileID);
if l(1) == 'd'
   c = split(l);
   X = str2double(c{2});
   Y = str2double(c{3});
end
n = X*Y;
Xmesh8 = zeros(Y,X);
Ymesh8 = zeros(Y,X);
for j = 1:Y
    for i = 1:X
        l = fgetl(fileID);
        c = split(l);
        Xmesh8(end+1-j,i) = str2double(c{2});
        Ymesh8(end+1-j,i) = str2double(c{3});
    end
end



l = fgetl(fileID);
if l(1) == 'd'
   c = split(l);
   X = str2double(c{2});
   Y = str2double(c{3});
end
n = X*Y;
Xmesh9 = zeros(Y,X);
Ymesh9 = zeros(Y,X);
for j = 1:Y
    for i = 1:X
        l = fgetl(fileID);
        c = split(l);
        Xmesh9(end+1-j,i) = str2double(c{2});
        Ymesh9(end+1-j,i) = str2double(c{3});
    end
end



Xmesh = [Xmesh7(1:end-1,:) Xmesh8(1:end-1,2:end) Xmesh9(1:end-1,2:end);...                                                            ; ...
        Xmesh4(1:end-1,:) Xmesh5(1:end-1,2:end) Xmesh6(1:end-1,2:end); ... 
        Xmesh1 Xmesh2(:,2:end) Xmesh3(:,2:end)];
    
Ymesh = [Ymesh7(1:end-1,:) Ymesh8(1:end-1,2:end) Ymesh9(1:end-1,2:end);...                                                            ; ...
        Ymesh4(1:end-1,:) Ymesh5(1:end-1,2:end) Ymesh6(1:end-1,2:end); ... 
        Ymesh1 Ymesh2(:,2:end) Ymesh3(:,2:end)];
    

save mesh Xmesh Ymesh