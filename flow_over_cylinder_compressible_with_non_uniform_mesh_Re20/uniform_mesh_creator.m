function msh = uniform_mesh_creator(x1, y1, xN, yN, delx, dely, delt)
msh.x_arr = x1:delx:xN;
msh.y_arr = y1:dely:yN;
[msh.X, msh.Y] = meshgrid(msh.x_arr, flip(msh.y_arr));
msh.NX = length(msh.x_arr);
msh.NY = length(msh.y_arr);
msh.xin = x1 - delx/2;
msh.xout = xN + delx/2;
msh.ybot = y1 - dely/2;
msh.ytop = yN + dely/2;
msh.chan_l = msh.xout - msh.xin;
msh.chan_w = msh.ytop - msh.ybot;
msh.delx = delx;
msh.dely = dely;
msh.delt = delt;
end