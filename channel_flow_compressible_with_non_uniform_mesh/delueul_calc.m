function geom = delueul_calc(D,geom)
delsmat = repmat(geom.dels',[geom.nsurround,1]);
geom.delueul = (D'.*delsmat)*geom.delub;
end