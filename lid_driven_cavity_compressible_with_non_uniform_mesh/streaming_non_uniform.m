function fprop = streaming_non_uniform(fprop,f,msh)

for k = 1:9
    ftemp = f(:,:,k);
    fprop(:,:,k) = sum(msh.a_coeffs(:,:,:,k).*ftemp(msh.linind_mat),3);
end

end