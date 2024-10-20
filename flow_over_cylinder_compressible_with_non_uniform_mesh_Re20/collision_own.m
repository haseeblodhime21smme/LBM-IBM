function f = collision_own(omega,fprop,feq,fvec_F,delt)
f = (1-omega)*fprop + omega*feq + fvec_F*delt;
end