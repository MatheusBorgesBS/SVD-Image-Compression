function[U,SIGMA,V] = svd_basica(A)
[L, C] = size(A);
[V,D] = eig(A'*A);
sigma = sqrt(diag(D));
[sigma, IDX] = sort(sigma,'descend');

SIGMA = zeros(size(A));
for i = 1:C
  SIGMA(i,i) = sigma(i);
endfor
SIGMA;

V = V(:,IDX);

U = zeros(L);
for i = 1:C
  U(:,i) = (1/sigma(i))*A*V(:,i);
endfor
endfunction
