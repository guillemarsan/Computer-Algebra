%% Division de polinomios multivariables
%
% Dados $f,g_{1},...,g_{s} \in F_{q}[x_{1},x_{2},...,x_{n}]$ calculamos
% $q_{1},...,q{s},r$ tales que $f = q_{1}g_{1} + ... + q_{s}g_{s} + r$
%
% $F_{q}$ es cualquier cuerpo y se puede hacer usando el orden de monomios
% lexicogr�fico, lexicogr�fico de grado y lexicogr�fico de grado inverso
%

path(path, 'Algorithms');
path(path, 'Classes');
clear
%% $$F_{q}[x,y] \quad q = 3^{1}$
% 

p = 3;
n = 1;
f = {[0 0 0],[1 0 1],[1 1 0],[0 2 0],[1 1 2]}; % f(x) = (1 + 2y^1 + 2x^1 + 1x^2 + 2x^1y^2)
g = {[1 0 0],[0 1 0],[1 1 1]}; % g(x) = (2 + 1x^1 + 2x^1y^1)
h = {[1 0 0],[0 1 0]}; % h(x) = (2 + 1x^1)

F = {g,h};

Fqx = FiniteFieldPoly(p,n);
MPFqx = FiniteFieldMultiPoly(Fqx,2);

% lex_order = @(x,y,z) MPFqx.lex_order(x,y,z);
lex_order = @(x,y,z) MPFqx.lex_gr_order(x,y,z);
% lex_order = @(x,y,z) MPFqx.lex_gr_r_order(x,y,z);

[Q,r] = mult_div(f,F,MPFqx,lex_order);

fprintf("(%s) = \n", MPFqx.gfshow(MPFqx,f));

for i = 1:length(F)
    fprintf("(%s)*(%s) +", MPFqx.gfshow(MPFqx,F{i}), MPFqx.gfshow(MPFqx,Q{i}));
end

fprintf("(%s)\n", MPFqx.gfshow(MPFqx,r)); 

%% $$F_{q}[x,y] \quad q = 3^{2}$ 
% 

p = 3;
n = 2;
f = {[1 0 1],[0 2 0],[1 1 2]}; % f(x) = ((0 + 1a)y^1 + (1 + 0a)x^2 + (0 + 1a)x^1y^2)
g = {[1 0 0],[1 1 1]}; % g(x) = ((0 + 1a) + (0 + 1a)x^1y^1)
h = {[1 0 0],[0 1 0]}; % h(x) = ((0 + 1a) + (1 + 0a)x^1)

F = {g,h};

Fqx = FiniteFieldPoly(p,n);
MPFqx = FiniteFieldMultiPoly(Fqx,2);

% lex_order = @(x,y,z) MPFqx.lex_order(x,y,z);
% lex_order = @(x,y,z) MPFqx.lex_gr_order(x,y,z);
lex_order = @(x,y,z) MPFqx.lex_gr_r_order(x,y,z);

[Q,r] = mult_div(f,F,MPFqx,lex_order);

fprintf("(%s) = \n", MPFqx.gfshow(MPFqx,f));

for i = 1:length(F)
    fprintf("(%s)*(%s) +", MPFqx.gfshow(MPFqx,F{i}), MPFqx.gfshow(MPFqx,Q{i}));
end

fprintf("(%s)\n", MPFqx.gfshow(MPFqx,r));