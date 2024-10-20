function geom = fvecb_calc(geom,rho,msh,t)
topind = (geom.neighnumy)/2;
botind = (geom.neighnumy)/2 + 1;
leftind = (geom.neighnumx)/2;
rightind = (geom.neighnumx)/2 + 1;

for i = 1:geom.n
    linindexmat = geom.linindex(topind:botind,leftind:rightind,i);
    rhomat = rho(linindexmat);
    dist_mat_r = geom.r(topind:botind,leftind:rightind,i);
    dist_mat_x = msh.X(linindexmat) - geom.fmidx(i);
    dist_mat_y = msh.Y(linindexmat) - geom.fmidy(i);
    dotmat = dist_mat_x.*geom.normvecx(i) + dist_mat_y.*geom.normvecy(i);
    node_class = dotmat >= 0;
    [jj, ii, v] = find(dist_mat_r.*node_class);
    [~,k] = min(v);
    geom.rhob(i) = rhomat(jj(k),ii(k));
    geom.fvec(i,:) = (2*geom.rhob(i).*geom.delub(i,:))/msh.delt;
end
geom.Fx(t) = -sum(geom.dels.*geom.fvec(:,1));
geom.Fy(t) = -sum(geom.dels.*geom.fvec(:,2));

end