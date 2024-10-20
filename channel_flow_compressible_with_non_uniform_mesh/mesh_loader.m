function msh = mesh_loader(delx,dely,delt)
load mesh Xmesh Ymesh

% Before scaling

x_arr = Xmesh(1,:);
y_arr = flip(Ymesh(:,1)');
delx_arr = diff(x_arr);
dely_arr = diff(y_arr);
minx = delx_arr(abs(x_arr) < 1e-5);
miny = dely_arr(abs(y_arr) < 1e-5);
scalex = delx/minx;
scaley = dely/miny;


% After scaling

msh.X = Xmesh*scalex;
msh.Y = Ymesh*scaley;
msh.x_arr = msh.X(1,:);
msh.y_arr = flip(msh.Y(:,1)');
msh.delx_arr = diff(msh.x_arr);
msh.dely_arr = diff(msh.y_arr);
msh.delx = delx;
msh.dely = dely;
msh.delt = delt;
msh.NX = length(msh.x_arr);
msh.NY = length(msh.y_arr);
msh.chan_l = sum(msh.delx_arr);
msh.chan_w = sum(msh.dely_arr);
msh.node = ones(msh.NY,msh.NX);
end