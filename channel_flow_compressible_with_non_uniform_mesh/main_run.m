clc
clear
close all

% Initialize (To be or not to be)

init_cond = 0;
mesh_reset_cond = 0;

% Mesh generation

delx = 1;
dely = delx;
delt = 1;
NSTEPS = 50;
msh = mesh_loader(delx,dely,delt);
NX = msh.NX;
NY = msh.NY;
X = msh.X;
Y = msh.Y;


% Other important input variables


Re = 100;
rho_avg = 1;
c = delx/delt;
cs = sqrt((1/3)*c);
u_inlet = 0.1*c;
ux_init = 0.0*c;
uy_init = 0.0*c;
u(:,:,1) = ux_init*ones(NY,NX);
u(:,:,2) = uy_init*ones(NY,NX);
rho = rho_avg*ones(NY,NX);
tau = (80*u_inlet)/(cs^2*Re) + 0.5;
omega = delt/tau;
vu = (tau - (delt/2))*(cs^2);
nu = vu*rho_avg;
NPOP = 9;
cvec_w = [4/9 1/9 1/9 1/9 1/9 1/36 1/36 1/36 1/36];
cvec_x = [0 1 0 -1 0 1 -1 -1 1];
cvec_y = [0 0 1 0 -1 1 1 -1 -1];
cvec = [cvec_x' cvec_y'];
feq = zeros(NY, NX, NPOP);


surf(msh.X,msh.Y,msh.node,'FaceColor','none','EdgeColor','black')
daspect([1 1 1])
view([0 0 1])

% Determination of coefficient matrix for non-uniform mesh

if isfile('msh.mat') && mesh_reset_cond == 0
    load msh
else 
    msh = non_uniform_mesh_mat(msh,cvec);
    save msh msh
end


if isfile('fprop.mat') && init_cond == 0
    load fprop
    f = fprop;
elseif init_cond == 1
    feq = feq_calc_comp(feq,u,cvec,cvec_w,NPOP,cs,rho,NY,NX);
    f = feq;
    fprop = feq;
elseif init_cond == 2
    for i = 1:NPOP
        feq(:,:,i) = cvec_w(i);
    end
    f = feq;
    fprop = feq;
end


tic
for t = 1:NSTEPS
    rho = rho_calc_own(fprop);
    u = u_calc_comp(cvec,fprop,rho);
    feq = feq_calc_comp(feq,u,cvec,cvec_w,NPOP,cs,rho,NY,NX);
    f = collision_own(omega,fprop,feq,delt);
    %fprop = streaming_own(fprop,f);
    fprop = streaming_non_uniform(fprop,f,msh);
    fprop = bc_calc_channel_comp(u_inlet,f,fprop,u,NX,NY,cs,rho,cvec,cvec_w);
end
toc

% Post-processing

figure;
surf(msh.X,msh.Y,u(:,:,1),'EdgeColor','none')
daspect([1 1 1])
view([0 0 1])
colorbar



save fprop fprop
save u u
save rho rho
save X X
save Y Y