function msh = node_classifier(msh,geom)
msh.node =  zeros(msh.NY,msh.NX);
for i = 1:msh.NX
    for j = 1:msh.NY
        dist_vec = [msh.X(j,i) - geom.fmidx, msh.Y(j,i) - geom.fmidy];
        dist_norm = vecnorm(dist_vec,2,2);
        [~,mini] = min(dist_norm);
        msh.node(j,i) = (geom.normvecx(mini)*dist_vec(mini,1) + geom.normvecy(mini)*dist_vec(mini,2)) >= 0; 
    end
end
end