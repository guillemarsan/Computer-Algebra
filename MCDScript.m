%% MCD en un DFU
%
%

path(path, 'Algorithms');
path(path, 'Classes');

%%  $$ Z[X] $$
f = [-4 0 1];
g = [2 1];

Zx = IntegerPoly;

fprintf("f(x) = %s\n",Zx.polyshow(Zx,f));
fprintf("g(x) = %s\n",Zx.polyshow(Zx,g));

gcd = euclid_primitive(f,g,Zx); % x+2
fprintf("gcd(f(x),g(x)) = %s\n", Zx.polyshow(Zx,gcd));