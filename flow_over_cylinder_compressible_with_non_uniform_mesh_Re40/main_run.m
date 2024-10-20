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
NSTEPS = 10000;
msh = mesh_loader(delx,dely,delt);
NX = msh.NX;
NY = msh.NY;
X = msh.X;
Y = msh.Y;

% Geometry generation

x_org = 0;
y_org = 0;
dia = 80.833;
n = 120;
geom = cylinder_geom_creator(x_org, y_org, dia, n, NSTEPS);


% Other important input variables


Re = 40;
rho_avg = 1;
c = delx/delt;
cs = sqrt((1/3)*c);
u_inlet = 0.1*c;
u_cylx = 0*c;
u_cyly = 0*c;
ux_init = 0.1*c;
uy_init = 0.0*c;
fx_init = 0;
fy_init = 0;
u(:,:,1) = ux_init*ones(NY,NX);
u(:,:,2) = uy_init*ones(NY,NX);
fvec(:,:,1) = fx_init*ones(NY,NX);
fvec(:,:,2) = fy_init*ones(NY,NX);
rho = rho_avg*ones(NY,NX);
tau = (geom.dia*u_inlet)/(cs^2*Re) + 0.5;
omega = delt/tau;
vu = (tau - (delt/2))*(cs^2);
nu = vu*rho_avg;
NPOP = 9;
cvec_w = [4/9 1/9 1/9 1/9 1/9 1/36 1/36 1/36 1/36];
cvec_x = [0 1 0 -1 0 1 -1 -1 1];
cvec_y = [0 0 1 0 -1 1 1 -1 -1];
cvec = [cvec_x' cvec_y'];
feq = zeros(NY, NX, NPOP);
fvec_F = zeros(NY, NX, NPOP);

% Nodes classification

msh = node_classifier(msh,geom);

mesh(msh.X,msh.Y,msh.node,'FaceColor','none','EdgeColor','black')
daspect([1 1 1])
view([0 0 1])
hold on
fill(geom.x,geom.y,'r','Marker','o')


% Determination of coefficient matrix for non-uniform mesh

if isfile('msh.mat') && mesh_reset_cond == 0
    load msh
else 
    msh = non_uniform_mesh_mat(msh,cvec);
    save msh msh
end


% Finding local regions
geom = indexer(geom,msh);
% Finding linear index
geom = linear_indexer(geom,msh);
% Calculating Delta for local regions
geom = delta_calc(geom, msh);
% Extracting D matrix
[D, Dmesh] = delta_transform(geom,msh);
% Calculating A and Ainv
A = A_calc(D,geom,msh);
% Calculate Pseudo Inverse
Ainv = inv(A);
% Define Velocity of Cylinder
geom = U_calc(geom, u_cylx, u_cyly);


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
    geom = u_star_calc(geom,u);
    B = B_calc(D,geom,msh);
    geom = delub_calc(geom,Ainv,B);
    geom = delueul_calc(D,geom);
    u = vel_correction(u,geom);
    fvec = fvec_calc(fvec,rho,geom,msh);
    geom = fvecb_calc(geom,rho,msh,t);
    fvec_F = fvec_F_calc_comp(fvec_F,u,fvec,cvec,cvec_w,NPOP,cs,tau,NY,NX);
    feq = feq_calc_comp(feq,u,cvec,cvec_w,NPOP,cs,rho,NY,NX);
    f = collision_own(omega,fprop,feq,fvec_F,delt);
    %fprop = streaming_own(fprop,f);
    fprop = streaming_non_uniform(fprop,f,msh);
    fprop = bc_calc_cyl_comp(u_inlet,f,fprop,u,NX,NY,cs,rho,cvec,cvec_w);
    if mod(t,100) == 0
        disp(geom.Fx(t)/(0.5*rho_avg*(u_inlet^2)*dia))
    end
end
toc



% Post-processing

CD = geom.Fx/(0.5*rho_avg*(u_inlet^2)*dia);
CL = geom.Fy/(0.5*rho_avg*(u_inlet^2)*dia);


figure;
surf(msh.X,msh.Y,u(:,:,1),'EdgeColor','none')
daspect([1 1 1])
view([0 0 1])
colorbar
hold on
fill3(geom.x,geom.y,100*ones(length(geom.x),1),'r')

figure;
plot(CD)
grid on

figure;
plot(CL)
grid on

save fprop fprop
save u u
save rho rho
save X X
save Y Y