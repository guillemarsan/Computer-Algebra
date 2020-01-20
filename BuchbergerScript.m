%% Factorización en Z[X]
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

F = {f,g,h};

Fqx = FiniteFieldPoly(p,n);
MPFqx = FiniteFieldMultiPoly(Fqx,2);

% lex_order = @(x,y,z) MPFqx.lex_order(x,y,z);
lex_order = @(x,y,z) MPFqx.lex_gr_order(x,y,z);
% lex_order = @(x,y,z) MPFqx.lex_gr_r_order(x,y,z);

G = buchberger(F,MPFqx,lex_order);

fprintf("Una base de Gröbner del ideal\n I = <");

for i = 1:length(F)
    fprintf("%s", MPFqx.gfshow(MPFqx,F{i}));
    if i~=length(F)
        fprintf(",");
    end
end

fprintf("> es\n G = {");

for i = 1:length(G)
    fprintf("%s", MPFqx.gfshow(MPFqx,G{i}));
    if i~=length(G)
        fprintf(",");
    end
end

fprintf("}\n");

%% $$F_{q}[x,y] \quad q = 3^{2}$
% 

p = 3;
n = 2;
f = {[1 0 1],[0 2 0],[1 1 2]}; % f(x) = ((0 + 1a)y^1 + (1 + 0a)x^2 + (0 + 1a)x^1y^2)
g = {[1 0 0],[1 1 1]}; % g(x) = ((0 + 1a) + (0 + 1a)x^1y^1)
h = {[1 0 0],[0 1 0]}; % h(x) = ((0 + 1a) + (1 + 0a)x^1)

F = {f,g,h};

Fqx = FiniteFieldPoly(p,n);
MPFqx = FiniteFieldMultiPoly(Fqx,2);

% lex_order = @(x,y,z) MPFqx.lex_order(x,y,z);
% lex_order = @(x,y,z) MPFqx.lex_gr_order(x,y,z);
lex_order = @(x,y,z) MPFqx.lex_gr_r_order(x,y,z);

G = buchberger(F,MPFqx,lex_order);

fprintf("Una base de Gröbner del ideal\n I = <");

for i = 1:length(F)
    fprintf("%s", MPFqx.gfshow(MPFqx,F{i}));
    if i~=length(F)
        fprintf(",");
    end
end

fprintf("> es\n G = {");

for i = 1:length(G)
    fprintf("%s", MPFqx.gfshow(MPFqx,G{i}));
    if i~=length(G)
        fprintf(",");
    end
end

fprintf("}\n");