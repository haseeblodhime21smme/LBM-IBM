function geom = linear_indexer(geom,msh)
sz = [msh.NY msh.NX];
geom.linindex = sub2ind(sz, geom.INDy, geom.INDx);
geom.linindexarr = unique(reshape(geom.linindex,1,[],1));
geom.nsurround = length(geom.linindexarr);
end