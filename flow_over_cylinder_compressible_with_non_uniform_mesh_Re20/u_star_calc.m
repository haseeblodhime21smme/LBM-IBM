function geom = u_star_calc(geom,u)
geom.ustar = zeros(geom.nsurround,2);
ux = u(:,:,1);
uy = u(:,:,2);
geom.ustar(:,1) = ux(geom.linindexarr);
geom.ustar(:,2) = uy(geom.linindexarr);
end