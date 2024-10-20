clc
clear

load X
load Y
load u

fileID = fopen('solution.dat','w+');

% Title
title = 'LID_DRIVEN_CAVITY';
fprintf(fileID,'TITLE = "%s" \n',title);

% Variable Titles
fprintf(fileID, 'VARIABLES = "X" "Y" "U" "V" \n');

% Zone Declaration
fprintf(fileID, 'ZONE T = "Sample" \n');

% Grid Dimensions
i = size(u,2);
j = size(u,1);
k = 1;
fprintf(fileID,'I = %i, J = %i, K = %i \n',i,j,k);

% Zone Type and Datapacking
fprintf(fileID,'ZONETYPE = Ordered, DATAPACKING = BLOCK \n');

% Data
%{
for J = 1:j
    for I =1:i
        fprintf(fileID,'%.4f  %.4f  %.4f  %.4f\n', X(J,I), Y(J,I), u(J,I,1), u(J,I,2));
    end
end
%}


for J = 1:j
    for I =1:i
        fprintf(fileID,'%.4f ', X(J,I));
    end
    fprintf(fileID,'\n');
end


for J = 1:j
    for I =1:i
        fprintf(fileID,'%.4f ', Y(J,I));
    end
    fprintf(fileID,'\n');
end


for J = 1:j
    for I =1:i
        fprintf(fileID,'%.4f ', u(J,I,1));
    end
    fprintf(fileID,'\n');
end


for J = 1:j
    for I =1:i
        fprintf(fileID,'%.4f ', u(J,I,2));
    end
    fprintf(fileID,'\n');
end


fclose(fileID);