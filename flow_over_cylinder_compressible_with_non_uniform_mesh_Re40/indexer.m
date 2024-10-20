function geom = indexer(geom,msh)

geom.yind = zeros(4,geom.n);
geom.INDy = zeros(4,4,geom.n);
geom.xind = zeros(geom.n,4);
geom.INDx = zeros(4,4,geom.n);

for i = 1:geom.n
   geom.yind(:,i) = find(abs(msh.Y(:,1) - geom.fmidy(i)) <= 2);
   geom.INDy(:,:,i) = repmat(geom.yind(:,i),[1 4]);
   geom.xind(i,:) = find(abs(msh.X(1,:) - geom.fmidx(i)) <= 2);
   geom.INDx(:,:,i) = repmat(geom.xind(i,:),[4 1]);
end

geom.neighnumy = size(geom.yind,1);
geom.neighnumx = size(geom.xind,2);

end