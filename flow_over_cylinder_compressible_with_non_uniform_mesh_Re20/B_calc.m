function B = B_calc(D,geom,msh)
B = geom.Ub - msh.delx*msh.dely*D*geom.ustar;
end