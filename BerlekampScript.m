%% Factorización de Berlekamp
%
% Factorización de $f$ en $F_{q}[x]$
%

path(path, 'Algorithms');
path(path, 'Classes');
clear
%% $$F_{q}[x] \quad q = 11^{1}$ 
% 
p = 11;
n = 1;

fqx = FiniteFieldPoly(p,n);


f = [0 1 5 1 0 1 0]; %f(x) = 1 + 8x + 10x^2 + 8x^3 + x^4 + 8x^5 + x^6
fprintf("f(x) = %s\n", fqx.gfshow(fqx,f));

L = berlekamp(f,fqx);

fprintf("f(x) = ");
len = length(L);
for i = 1:len
    fprintf("(%s)", fqx.gfshow(fqx,L{i}));
end
fprintf("\n");

%% $$F_{q}[x] \quad q = 11^{2}$
% 
p = 11;
n = 2;

fqx = FiniteFieldPoly(p,n);


f = [0 1 5 1 0 1 0]; % f(x) = (1 + 0a) + (0 + 1a)x + (8 + 7a)x^2 + ...
                     % (0 + 1a)x^3 + (1 + 0a)x^4 + (0 + 1a)x^5 + (1 + 0a)x^6
fprintf("f(x) = %s\n", fqx.gfshow(fqx,f));

L = berlekamp(f,fqx);

fprintf("f(x) = ");
len = length(L);
for i = 1:len
    fprintf("(%s)", fqx.gfshow(fqx,L{i}));
end
fprintf("\n");