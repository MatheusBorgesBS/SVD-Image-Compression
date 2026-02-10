rng(42)
clc
clear
qtd = 20;
x = randn(1, qtd) * 5;
y = 1/3*x + rand(1,qtd) * 2;
x -= mean(x);
y -= mean(y);
plot(x,y, '.', 'markersize', 25)
hold on;

A = [x',y'];
[U,SIGMA,V] = svd_basica(A);
A_new = U*SIGMA*V';
plot(A(:,1),A(:,2),'+','markersize', 25)
hold on;
norm(A-A_new)
erro_rel = norm(A-A_new)/norm(A)*100

# Compressão
k = 1;
A_comprimida = U(:,1:k) * SIGMA(1:k,1:k) * V(:,1:k)';
norm(A-A_comprimida)
erro_rel = norm(A-A_comprimida)/norm(A)*100
plot(A_comprimida(:,1),A_comprimida(:,2),'.','markersize', 25)
legend('Original', 'Svd full','Svd comprimida');


