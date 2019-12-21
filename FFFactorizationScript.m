%% Factorización de un polinomio en un cuerpo finito parte 1, parte 2, parte 3
%
% SFD, DDF , EDF
% SFD: Monic as input and factors are square-free (cannot de decomposed as
% a square)
%

path(path, 'Algorithms');
path(path, 'Classes');
clear
%% $$F_{q}[x] \quad q = 3^{1}$ SDF
% 
p = 3;
n = 1;

fqx = FiniteFieldPoly(p,n);

f = [-Inf 1 1 -Inf 1 0 0 -Inf 0]; %f(x) = 0 + 2x + 1x^2 + 0x^3 + 0x^4 + 2x^5 + 0x^6 + 1x^7 + 1x^8
fprintf("f(x) = %s\n", fqx.gfshow(fqx,f));

L = sfd(f,fqx);

fprintf("f(x) = ");
len = length(L);
for i = 1:len
    fprintf("(%s)^%i", fqx.gfshow(fqx,L{i}{1}), L{i}{2});
end
fprintf("\n");

%% DDF
f = [-Inf 1 -Inf 0 0 1 0]; %f(x) = 2x + x^3 + x^4 + 2x^5 + x^6
fprintf("f(x) = %s\n", fqx.gfshow(fqx,f));

L = ddf(f,fqx);

fprintf("f(x) = ");
len = length(L);
for i = 1:len
    fprintf("(%s,%i)", fqx.gfshow(fqx,L{i}{1}), L{i}{2});
end
fprintf("\n");

%% EDF
f = [-Inf 0 0]; %x + x^2
k = 1;
fprintf("f(x) = %s   k = %i\n", fqx.gfshow(fqx,f), k);

L = edf(f,k,fqx);

fprintf("f(x) = ");
len = length(L);
for i = 1:len
    fprintf("%s,", fqx.gfshow(fqx,L{i}));
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