%% Inverso en un Cuerpo Finito
% Dado $p$ primo y $f$ irreducible en $Z_{p}[x]$ construimos
% $K:= \frac{Z_{p}[x]}{f(x)}$ con $|K|=p^{deg(f)}$ y calculamos el inverso
% de $g$ en $K$
%
%

path(path, 'Algorithms');
path(path, 'Classes');
clear
%%  $$ K[x] = \frac{Z_{p}[x]}{f(x)} \: Ej1 $$
p = 7;
f = [2 4 1];

g = [4 5];

Zpx = FiniteFieldPoly(p,1);
fprintf("p = %i\n",p);
fprintf("f(x) = %s\n",Zpx.gfshow(Zpx,f));
fprintf("g(x) = %s\n",Zpx.gfshow(Zpx,g));

inv = inverse(g,f,Zpx); % 2+3x
fprintf("inv(g(x)) = %s\n", Zpx.gfshow(Zpx,inv));

%%  $$ K[x] = \frac{Z_{p}[x]}{f(x)} \: Ej2 $$
p = 7;
f = [-Inf 5 1 0];

g = [5 -Inf 0];

Zpx = FiniteFieldPoly(p,1);
fprintf("p = %i\n",p);
fprintf("f(x) = %s\n",Zpx.gfshow(Zpx,f));
fprintf("g(x) = %s\n",Zpx.gfshow(Zpx,g));

inv = inverse(g,f,Zpx); % 5 + 1x
fprintf("inv(g(x)) = %s\n", Zpx.gfshow(Zpx,inv));