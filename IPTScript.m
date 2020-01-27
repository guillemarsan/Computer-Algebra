%% Test de irreducibilidad IPT
%
% Dado $f$ determinamos si es irreducible en un cuerpo $F_{q}[x]$
%
path(path, 'Algorithms');
path(path, 'Classes');
clear
%% $$F_{q}[x] \quad q = 3^{1}$ 
% 
p = 3;
n = 1;

fqx = FiniteFieldPoly(p,n);

f = [0 1 -Inf 0]; %f(x) = 1 + x + x^2
fprintf("f(x) = %s\n", fqx.gfshow(fqx,f));

irr = ipt(f,fqx);
if irr ~= 0
    fprintf("f(x) es irreducible\n");
else
    fprintf("f(x) no es irreducible\n");
end

%% $$F_{q}[x] \quad q = 3^{2}$ 
% 
p = 3;
n = 2;

fqx = FiniteFieldPoly(p,n);

f = [0 0 0]; %f(x) = (1 + 0a) + (1 + 0a)x + (1 + 0a)x^2
fprintf("f(x) = %s\n", fqx.gfshow(fqx,f));

irr = ipt(f,fqx);
if irr ~= 0
    fprintf("f(x) es irreducible\n");
else
    fprintf("f(x) no es irreducible\n");
end