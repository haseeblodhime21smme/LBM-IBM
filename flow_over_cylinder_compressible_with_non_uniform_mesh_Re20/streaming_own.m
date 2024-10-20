function fprop = streaming_own(fprop,f)
fprop(:,:,1) = f(:,:,1);
fprop(:,:,2) = circshift(f(:,:,2),[0 1]);
fprop(:,:,3) = circshift(f(:,:,3),[-1 0]);
fprop(:,:,4) = circshift(f(:,:,4),[0 -1]);
fprop(:,:,5) = circshift(f(:,:,5),[1 0]);
fprop(:,:,6) = circshift(f(:,:,6),[-1 1]);
fprop(:,:,7) = circshift(f(:,:,7),[-1 -1]);
fprop(:,:,8) = circshift(f(:,:,8),[1 -1]);
fprop(:,:,9) = circshift(f(:,:,9),[1 1]);
end