function geom = U_calc(geom,u_cylx, u_cyly)
geom.Ub = [ones(geom.n,1)*u_cylx ones(geom.n,1)*u_cyly];
end