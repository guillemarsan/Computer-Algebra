%% Factorización de un polinomio en un cuerpo finito parte 1, parte 2, parte 3
%
% SFD, DDF , EDF
% SFD: Monic as input and factors are square-free (cannot de decomposed as
% a square)
%

path(path, 'Algorithms');
path(path, 'Classes');
clear
%% $$F_{q}[x] \quad q = 3^{1}$
% 
p = 3;
n = 1;

fqx = FiniteFieldPoly(p,n);

f = [1 1 0 0]; 
fprintf("f(x) = %s\n", fqx.gfshow(fqx,f));

L = sfd(f,fqx);

fprintf("f(x) = ");
len = length(L);
for i = 1:len
    fprintf("(%s)^%i", fqx.gfshow(fqx,L{i}{1}), L{i}{2});
end
fprintf("\n");


%% $$F_{q}[x] \quad q = 3^{2}$
% 
p = 3;
n = 2;

fqx = FiniteFieldPoly(p,n);

f = [6 7 1]; 
fprintf("f(x) = %s\n", fqx.gfshow(fqx,f));

L = sfd(f,fqx);

fprintf("f(x) = ");
len = length(L);
for i = 1:len
    fprintf("(%s)^%i", fqx.gfshow(fqx,L{i}{1}), L{i}{2});
end
fprintf("\n");