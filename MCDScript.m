%% MCD en un DFU
% 
% Cálculo de $mcd(a,b)$ con $a,b\in R[x]$ y $R$ un $DFU$ cualquiera
% 

path(path, 'Algorithms');
path(path, 'Classes');
clear
%%  $$ Z[X] \: Ej1 $$
f = [1 10 23 14];
g = [1 0 -19 -30];


Zx = IntegerPoly;

fprintf("f(x) = %s\n",Zx.polyshow(Zx,f));
fprintf("g(x) = %s\n",Zx.polyshow(Zx,g));

gcd = euclid_primitive(f,g,Zx); % x+2
fprintf("gcd(f(x),g(x)) = %s\n", Zx.polyshow(Zx,gcd));

%% $$ Z[X] \: Ej2 $$

f = [1 7 9 13];
g = [-2 -10 10 10 52 0];

Zx = IntegerPoly;

fprintf("f(x) = %s\n",Zx.polyshow(Zx,f));
fprintf("g(x) = %s\n",Zx.polyshow(Zx,g));

gcd = euclid_primitive(f,g,Zx); % 1x^3+7x^2+9x+13
fprintf("gcd(f(x),g(x)) = %s\n", Zx.polyshow(Zx,gcd));

%% $$ Z[X] \: Ej3 \: Coprimos $$

f = [1 7 9 13];
g = [2 3 5 -10 5];

Zx = IntegerPoly;

fprintf("f(x) = %s\n",Zx.polyshow(Zx,f));
fprintf("g(x) = %s\n",Zx.polyshow(Zx,g));

gcd = euclid_primitive(f,g,Zx); % 1
fprintf("gcd(f(x),g(x)) = %s\n", Zx.polyshow(Zx,gcd));