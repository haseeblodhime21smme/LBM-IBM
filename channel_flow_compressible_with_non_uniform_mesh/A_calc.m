function A = A_calc(D,geom,msh)
delsmat = repmat(geom.dels',[geom.nsurround,1]);
A = msh.delx*msh.dely*(D*(D'.*delsmat));
end