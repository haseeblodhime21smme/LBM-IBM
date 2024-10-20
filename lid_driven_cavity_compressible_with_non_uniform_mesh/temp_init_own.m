function temp2 = temp_init_own(NY,NX,NPOP,NSTEPS)
temp2.rho = zeros(NY,NX,NSTEPS);
temp2.u = zeros(NY,NX,NSTEPS);
temp2.v = zeros(NY,NX,NSTEPS);
temp2.feq = zeros(NY,NX,NPOP,NSTEPS);
temp2.f_bpc = zeros(NY,NX,NPOP,NSTEPS);
temp2.f_apc = zeros(NY,NX,NPOP,NSTEPS);
temp2.fprop_bbc = zeros(NY,NX,NPOP,NSTEPS);
temp2.fprop_abc = zeros(NY,NX,NPOP,NSTEPS);
end