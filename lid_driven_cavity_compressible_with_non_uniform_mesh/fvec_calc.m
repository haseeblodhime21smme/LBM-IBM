function fvec = fvec_calc(fvec,rho,geom,msh)
rhovec = rho(geom.linindexarr');
fvecx = zeros(msh.NY,msh.NX);
fvecy = zeros(msh.NY,msh.NX);
fvecvec = 2*rhovec.*(geom.delueul/msh.delt);
fvecx(geom.linindexarr) = fvecvec(:,1);
fvecy(geom.linindexarr) = fvecvec(:,2);
fvec(:,:,1) = fvecx;
fvec(:,:,2) = fvecy;
end