clc
clear

A = imread ("sqrAy.jpg");
X = double(rgb2gray(A));

figure;
subplot(2,4,1);
imagesc(X), axis off, colormap('gray');
title('Original');


[U, S, V] = svd(X,'econ');

plots = 2;
for r = [5 20 100]
  Xaprox = U(:,1:r)*S(1:r,1:r)*V(:,1:r)';
  subplot(2,4,plots), plots += 1;
  imagesc(Xaprox), axis off, colormap('gray');

  erro_abs = norm(X - Xaprox)
  erro_relativo = erro_abs/norm(X)*100
  title(sprintf('built in function: r=%d (erro: %.2f%%)', r, erro_relativo));
endfor
disp('------------------------------------')

plots = 5;
[U, S, V] = svd_economica(X);
for r = [5 20 100]
  Xaprox = U(:,1:r)*S(1:r,1:r)*V(:,1:r)';
  subplot(2,4,plots), plots += 1;
  imagesc(Xaprox), axis off, colormap('gray');
  erro_abs = norm(X - Xaprox)
  erro_relativo = erro_abs/norm(X)*100
  title(sprintf('my function: r=%d (erro: %.2f%%)', r, erro_relativo));
endfor

figure;
subplot(1, 2, 1)
semilogy(diag(S), 'k', 'LineWidth', 2);
grid on;
xlabel('r');
ylabel('Valor singular, \sigma_r');
xlim([-50 1550]);
set(gca, 'Fontsize', 14);

subplot(1, 2, 2)
plot(cumsum(diag(S)) / sum(diag(S)), 'k', 'LineWidth', 2);
grid on;
xlabel('r');
ylabel('Energia acumulada');
xlim([-50 1550]);
set(gca, 'Fontsize', 14);

figure;
XXt = X*X';
XtX = X'*X;
subplot(1,2,1)
imagesc(XXt);
axis off, colormap('gray');
subplot(1,2,2)
imagesc(XtX)
axis off, colormap('gray');
