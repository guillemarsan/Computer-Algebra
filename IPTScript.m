%% Test de irreducibilidad IPT
%
% 
%
path(path, 'Algorithms');
path(path, 'Classes');
clear
%% $$F_{q}[x] \quad q = 3^{1}$ SDF
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

%% $$F_{q}[x] \quad q = 3^{2}$ SDF
% 
p = 3;
n = 2;

fqx = FiniteFieldPoly(p,n);

f = [0 0 0]; %f(x) = 1 + x + x^2
fprintf("f(x) = %s\n", fqx.gfshow(fqx,f));

irr = ipt(f,fqx);
if irr ~= 0
    fprintf("f(x) es irreducible\n");
else
    fprintf("f(x) no es irreducible\n");
end