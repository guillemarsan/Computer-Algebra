%% Logaritmo discreto en cuerpo Fq[x]/f(x)
%
% Usamos el algoritmo de rho de Pollard para el logaritmo
%

path(path, 'Algorithms');
path(path, 'Classes');
clear
%% $$\frac{F_{q}[x]}{f(x)} \quad q = 5^{1} \quad f(x) = x$ SDF
% 

p = 5;
n = 1;
f = [-Inf 0];

Fqx = FiniteFieldPoly(p,n);

base = [3];
elem = [2];
fprintf("base = %s\n", Fqx.gfshow(Fqx,base));
fprintf("elem = %s\n", Fqx.gfshow(Fqx,elem));

log = pollard_rho(base,elem,f,Fqx);

fprintf("log_base(elem) = %d\n",log);