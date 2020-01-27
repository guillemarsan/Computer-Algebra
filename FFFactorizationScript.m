%% Factorización de un polinomio en un cuerpo finito parte 1, parte 2, parte 3
%
% SFD: Factorización libre de cuadrados
%
% DDF: Factorización en grados distintos
%
% EDF: Factorización de mismo grado
%

path(path, 'Algorithms');
path(path, 'Classes');
clear
%% $$F_{q}[x] \quad q = 3^{1}$ 
%% SDF
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
%% SDF
% 
p = 3;
n = 2;

fqx = FiniteFieldPoly(p,n);


f = [7 7 5 3 0 -Inf 0]; %f(x) = (1 + 1a) + (1 + 1a)x + (0 + 2a)x^2 + 
                        %(2 + 2a)x^3 + (1 + 0a)x^4 + (0 + 0a)x^5 + (1 + 0a)x^6
fprintf("f(x) = %s\n", fqx.gfshow(fqx,f));

L = sfd(f,fqx);

fprintf("f(x) = ");
len = length(L);
for i = 1:len
    fprintf("(%s)^%i", fqx.gfshow(fqx,L{i}{1}), L{i}{2});
end
fprintf("\n");

%% DDF

f = [7 3 0 0 0]; %f(x) = (1 + 1a) + (2 + 2a)x + (1 + 0a)x^2 + (1 + 0a)x^3 + (1 + 0a)x^4
fprintf("f(x) = %s\n", fqx.gfshow(fqx,f));

L = ddf(f,fqx);

fprintf("f(x) = ");
len = length(L);
for i = 1:len
    fprintf("(%s,%i)", fqx.gfshow(fqx,L{i}{1}), L{i}{2});
end
fprintf("\n");

%% EDF

f = [7 2 0]; % f(x) = (1 + 1a) + (1 + 2a)x + (1 + 0a)x^2
k = 1;
fprintf("f(x) = %s   k = %i\n", fqx.gfshow(fqx,f), k);

L = edf(f,k,fqx);

fprintf("f(x) = ");
len = length(L);
for i = 1:len
    fprintf("%s,", fqx.gfshow(fqx,L{i}));
end
fprintf("\n");
