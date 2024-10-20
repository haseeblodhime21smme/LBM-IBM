function geom = cylinder_geom_creator(x_org, y_org, dia, n, NSTEPS)
r = dia/2;
geom.dia = dia;
thta_arr = linspace(-180,180,n+1);
thta_arr = flip(thta_arr);
geom.x = cosd(thta_arr')*r + x_org;
geom.y = sind(thta_arr')*r + y_org;
geom.x = geom.x(1:end-1);
geom.y = geom.y(1:end-1);
geom.fmidx = zeros(n,1);
geom.fmidy = zeros(n,1);
geom.tangvecx = zeros(n,1);
geom.tangvecy = zeros(n,1);
geom.normvecx = zeros(n,1);
geom.normvecy = zeros(n,1);
geom.dels = zeros(n,1);
geom.fvec = zeros(n,2);
geom.rhob = zeros(n,1);
geom.Fx = zeros(NSTEPS,1);
geom.Fy = zeros(NSTEPS,1);
geom.n = n;

nsecond = circshift(1:n,-1);
for k = 1:n
   geom.fmidx(k) = (geom.x(k) + geom.x(nsecond(k)))/2;
   geom.fmidy(k) = (geom.y(k) + geom.y(nsecond(k)))/2;
   geom.tangvecx(k) = geom.x(nsecond(k)) - geom.x(k);
   geom.tangvecy(k) = geom.y(nsecond(k)) - geom.y(k);
   geom.normvecx(k) = -geom.tangvecy(k);
   geom.normvecy(k) = geom.tangvecx(k);
   geom.dels(k) = norm([geom.tangvecx(k) geom.tangvecy(k)]);
end
end