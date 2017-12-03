clc; clear all; close all

u_exact = @(x) x.^4 / 12 - x.^3 / 6 + x / 12;
fplot(u_exact, [0,1]);
hold on;  

N = 20; h = 1/N;
x = linspace(h, 1-h, N-1)'; 
b = u_exact(x);
A = (N^2)*(diag(2*ones(N-1, 1),0) - diag(ones(N-2,1),1) - diag(ones(N-2,1),-1));
[L,U,P] = lu(A);
y = subs_directe(L,b);
u = subs_retrograde(U,y);

plot(x, u, 'or');
legend('u_{exacte}','u_{i}')
saveas(gcf,'ex2_uexact','epsc')