%% Inverse in a Finite Field
%
%

path(path, 'Algorithms');
path(path, 'Classes');
clear
%%  $$ K[X] = Zp[x]/f $$
p = 7;
f = [2 4 1];

g = [4 5];

Zpx = FiniteFieldPoly(p,1);
fprintf("p = %i\n",p);
fprintf("f(x) = %s\n",Zpx.gfshow(Zpx,f));
fprintf("g(x) = %s\n",Zpx.gfshow(Zpx,g));

inv = inverse(g,f,Zpx); % 2+3x
fprintf("inv(f(x)) = %s\n", Zpx.gfshow(Zpx,inv));