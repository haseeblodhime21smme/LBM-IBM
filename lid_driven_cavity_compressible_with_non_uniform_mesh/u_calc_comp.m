function u = u_calc_comp(cvec,f,rho)
cvec_trans = cvec';
f_permuted = permute(f,[3,1,2]);
cvec_f = zeros(size(cvec_trans,1), size(f_permuted,2), size(f_permuted,3));
for k = 1:size(f_permuted,3)
    cvec_f(:,:,k) = cvec_trans*f_permuted(:,:,k);
end
%cvec_f = pagemtimes(cvec_trans,f_permuted);
u = permute(cvec_f,[2,3,1])./rho;
end
