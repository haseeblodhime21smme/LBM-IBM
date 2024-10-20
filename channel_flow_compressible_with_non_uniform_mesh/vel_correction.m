function u = vel_correction(u, geom)
ustarx = u(:,:,1);
ustary = u(:,:,2);
ustarx(geom.linindexarr) = ustarx(geom.linindexarr)' + geom.delueul(:,1);
ustary(geom.linindexarr) = ustary(geom.linindexarr)' + geom.delueul(:,2);
u(:,:,1) = ustarx;
u(:,:,2) = ustary;
end