function geom = delta_calc(geom, msh)


geom.r = zeros(geom.neighnumy,geom.neighnumx,geom.n);
geom.delx = zeros(geom.neighnumy,geom.neighnumx,geom.n);
geom.dely = zeros(geom.neighnumy,geom.neighnumx,geom.n);
geom.delta = zeros(geom.neighnumy,geom.neighnumx,geom.n);

%geom.deltar = zeros(size(geom.yind,1),size(geom.xind,2),geom.n);

for i = 1:geom.n
    geom.delx(:,:,i) = abs(geom.fmidx(i) - msh.X(geom.yind(:,i),geom.xind(i,:)))/msh.delx;
    geom.dely(:,:,i) = abs(geom.fmidy(i) - msh.Y(geom.yind(:,i),geom.xind(i,:)))/msh.dely;
    geom.r(:,:,i) = sqrt(geom.delx(:,:,i).^2 + geom.dely(:,:,i).^2);
end

geom.delta = ((geom.delx <= 2) .* (0.25 *(1 + cos(pi*geom.delx/2)))) .* ...
             ((geom.dely <= 2) .* (0.25 *(1 + cos(pi*geom.dely/2)))) * 1/(msh.delx*msh.dely);
%geom.deltar = ((geom.r <= 2) .* (0.25 *(1 + cos(pi*geom.r/2))));
end