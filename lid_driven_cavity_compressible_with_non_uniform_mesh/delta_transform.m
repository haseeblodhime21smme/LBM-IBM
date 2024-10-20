function [D, Dmesh] = delta_transform(geom,msh)

D = zeros(geom.n,geom.nsurround);
Dmesh = zeros(msh.NY,msh.NX);
for i = 1:geom.n
Dmesh(geom.linindex(:,:,i)) = geom.delta(:,:,i);
D(i,:) = Dmesh(geom.linindexarr);
Dmesh(geom.linindex(:,:,i)) = 0;
end
%{
D = zeros(geom.n,geom.neighnumx*geom.neighnumy);
transposed_delta = permute(geom.delta,[2,1,3]);
reshaped_delta = reshape(transposed_delta,[1,geom.neighnumx*geom.neighnumy,geom.n]);
for i = 1:geom.n
    D(i,:) = reshaped_delta(:,:,i);
end
%}
end