function f = collision_own(omega,fprop,feq, delt)
f = (1-omega)*fprop + omega*feq;
end