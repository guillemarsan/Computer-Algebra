%% Logaritmo discreto en cuerpo Fq[x]/f(x)
%
% Dado $f$ construimos $K:=F_{q}[x]/f(x)$ 
% y dados $b$ y $h$, calculamos $\gamma$ tal que $b^{\gamma} = h$ en $K$
% usando el algoritmo de rho de Pollard.
%

path(path, 'Algorithms');
path(path, 'Classes');
clear
%% $$\frac{F_{q}[x]}{f(x)} \quad q = 3^{1}$ 
% 

p = 3;
n = 1;
f = [1 -Inf 0 0]; % f(x) = 2 + 0x + 1x^2 + 1x^3

Fqx = FiniteFieldPoly(p,n);

base = [0 0]; % base = 1 + 1x
elem = [0 -Inf -Inf 0]; % elem = 1 + 0x + 0x^2 + 1x^3
fprintf("f(x) = %s\n", Fqx.gfshow(Fqx,f));
fprintf("base = %s\n", Fqx.gfshow(Fqx,base));
fprintf("elem = %s\n", Fqx.gfshow(Fqx,elem));

log = pollard_rho(base,elem,f,Fqx);
fprintf("En Z_%i (%s)^%i = %s mod %s\n",p, Fqx.gfshow(Fqx,base), log, ...
            Fqx.gfshow(Fqx,elem), Fqx.gfshow(Fqx,f));

%% $$\frac{F_{q}[x]}{f(x)} \quad q = 3^{2}$ 
% 

p = 3;
n = 2;
f = [1 3 7 3]; % f(x) = (0 + 1a) + (2 + 2a)x + (1 + 1a)x^2 + (2 + 2a)x^3

Fqx = FiniteFieldPoly(p,n);

base = [4 3]; % base = (2 + 0a) + (2 + 2a)x
elem = [2 0 5]; % elem = (1 + 2a) + (1 + 0a)x + (0 + 2a)x^2
fprintf("f(x) = %s\n", Fqx.gfshow(Fqx,f));
fprintf("base = %s\n", Fqx.gfshow(Fqx,base));
fprintf("elem = %s\n", Fqx.gfshow(Fqx,elem));

log = pollard_rho(base,elem,f,Fqx);
fprintf("En F_%i [%s]^%i = [%s] mod [%s]\n",p^n, Fqx.gfshow(Fqx,base), log, ...
            Fqx.gfshow(Fqx,elem), Fqx.gfshow(Fqx,f));