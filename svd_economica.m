function [U, SIGMA, V] = svd_economica(A)
  [m, n] = size(A);
  r = min(m, n);

  if m >= n
    [V, D] = eig(A' * A);
    sigma = sqrt(diag(D));
    [sigma, idx] = sort(sigma, 'descend');
    V = V(:, idx);


    SIGMA = diag(sigma(1:r));


    U = zeros(m, r);
    for i = 1:r
      if sigma(i) > 1e-10
        U(:, i) = (1/sigma(i)) * A * V(:, i);
      endif
    endfor

  else

    [U, D] = eig(A * A');
    sigma = sqrt(diag(D));
    [sigma, idx] = sort(sigma, 'descend');
    U = U(:, idx);


    SIGMA = diag(sigma(1:r));

    V = zeros(n, r);
    for i = 1:r
      if sigma(i) > 1e-10
        V(:, i) = (1/sigma(i)) * A' * U(:, i);
      endif
    endfor
  endif
endfunction
