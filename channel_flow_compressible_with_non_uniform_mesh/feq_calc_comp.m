function feq = feq_calc_comp(feq,u,cvec,cvec_w,NPOP,cs,rho,NY,NX)
out1 = zeros(NY,NX);
for k = 1:NPOP
    for j = 1:NY
        for i = 1:NX
            out1(j,i) = ((u(j,i,1)*cvec(k,1)) +(u(j,i,2)*cvec(k,2)))/cs^2 + ...
                        (((u(j,i,1)*cvec(k,1)) +(u(j,i,2)*cvec(k,2)))^2)/(2*cs^4) - ...
                        ((u(j,i,1)*u(j,i,1)) +(u(j,i,2)*u(j,i,2)))/(2*cs^2) ;
        end
    end
    out2 = out1.*rho;
    out3 = rho + out2;
    feq(:,:,k) = cvec_w(k)*out3;
end
end