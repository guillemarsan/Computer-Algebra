%% MCD en un DFU
%
%

path(path, 'Algorithms');
path(path, 'Classes');
clear
%%  $$ Z[X] $$
f = [1 10 23 14];
g = [1 0 -19 -30];


Zx = IntegerPoly;

fprintf("f(x) = %s\n",Zx.polyshow(Zx,f));
fprintf("g(x) = %s\n",Zx.polyshow(Zx,g));

gcd = euclid_primitive(f,g,Zx); % x+2
fprintf("gcd(f(x),g(x)) = %s\n", Zx.polyshow(Zx,gcd));