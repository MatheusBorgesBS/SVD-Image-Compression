clc
clear

A = [1 2; 0 1;1 0]

[U,SIGMA,V] = svd_basica(A)

A_new = U*SIGMA*V'

norm(A - A_new)

