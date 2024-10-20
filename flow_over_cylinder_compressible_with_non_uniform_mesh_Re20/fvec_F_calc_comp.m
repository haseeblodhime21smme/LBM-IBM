function fvec_F = fvec_F_calc_comp(fvec_F,u,fvec,cvec,cvec_w,NPOP,cs,tau,NY,NX)
out = zeros(NY,NX);
for k = 1:NPOP
    for j = 1:NY
        for i = 1:NX
              out(j,i)     =       ((cvec(k,1) - u(j,i,1))/cs^2  + ...                                            
                            ((cvec(k,1)*u(j,i,1) + cvec(k,2)*u(j,i,2))/cs^4)*cvec(k,1))*fvec(j,i,1)  + ...
                                    ((cvec(k,2) - u(j,i,2))/cs^2  + ...                                         
                            ((cvec(k,1)*u(j,i,1) + cvec(k,2)*u(j,i,2))/cs^4)*cvec(k,2))*fvec(j,i,2);
        end
    end
fvec_F(:,:,k) = (1 - 1/(2*tau))*cvec_w(k)*out;    
end
end