%% Logaritmo discreto en cuerpo Fq[x]/f(x)
%
% Usamos el algoritmo de rho de Pollard para el logaritmo
%

path(path, 'Algorithms');
path(path, 'Classes');
clear
%% $$\frac{F_{q}[x]}{f(x)} \quad q = 3^{1} \quad f(x) = x$ 
% 

p = 3;
n = 1;
f = [1 -Inf 0 0];

Fqx = FiniteFieldPoly(p,n);

base = [0 0];
elem = [0 -Inf -Inf 0];
fprintf("base = %s\n", Fqx.gfshow(Fqx,base));
fprintf("elem = %s\n", Fqx.gfshow(Fqx,elem));

log = pollard_rho(base,elem,f,Fqx);

fprintf("log_base(elem) = %d\n",log);