function fprop = bc_calc_lid_comp(u_top,f,fprop,u,NX,NY,cs,rho,cvec,cvec_w)

% Left

u_left_vec_arr = [zeros(NY,1) zeros(NY,1)];
fprop(:,1,2) = f(:,1,4) - 2*cvec_w(4)*rho(:,1).*(u_left_vec_arr*(cvec(4,:)')/(cs^2));
fprop(:,1,6) = f(:,1,8) - 2*cvec_w(8)*rho(:,1).*(u_left_vec_arr*(cvec(8,:)')/(cs^2));
fprop(:,1,9) = f(:,1,7) - 2*cvec_w(7)*rho(:,1).*(u_left_vec_arr*(cvec(7,:)')/(cs^2));

% Top
u_top_vec_arr = [u_top*ones(1,NX); zeros(1,NX)];
fprop(1,:,9) = f(1,:,7)  - 2*cvec_w(7)*rho(1,:).*((cvec(7,:)*u_top_vec_arr)/(cs^2));
fprop(1,:,5) = f(1,:,3)  - 2*cvec_w(3)*rho(1,:).*((cvec(3,:)*u_top_vec_arr)/(cs^2));
fprop(1,:,8) = f(1,:,6)  - 2*cvec_w(6)*rho(1,:).*((cvec(6,:)*u_top_vec_arr)/(cs^2));

% Bottom
u_bot_vec_arr = [zeros(1,NX); zeros(1,NX)];
fprop(NY,:,6) = f(NY,:,8) - 2*cvec_w(8)*rho(NY,:).*((cvec(8,:)*u_bot_vec_arr)/(cs^2));
fprop(NY,:,3) = f(NY,:,5) - 2*cvec_w(5)*rho(NY,:).*((cvec(5,:)*u_bot_vec_arr)/(cs^2));
fprop(NY,:,7) = f(NY,:,9) - 2*cvec_w(9)*rho(NY,:).*((cvec(9,:)*u_bot_vec_arr)/(cs^2));

% Right
u_right_vec_arr = [zeros(NY,1) zeros(NY,1)];
fprop(:,NX,7) = f(:,NX,9) - 2*cvec_w(9)*rho(:,NX).*(u_right_vec_arr*(cvec(9,:)')/(cs^2));
fprop(:,NX,4) = f(:,NX,2) - 2*cvec_w(2)*rho(:,NX).*(u_right_vec_arr*(cvec(2,:)')/(cs^2));
fprop(:,NX,8) = f(:,NX,6) - 2*cvec_w(6)*rho(:,NX).*(u_right_vec_arr*(cvec(6,:)')/(cs^2));


end