%% Algoritmo de Euclides
%
%

path(path, 'Algorithms');
path(path, 'Classes');

%%  $$ Z $$
a = 24
b = -27

Z = Integers;

gcd = euclid(a,b,Z) % -3

% gcd = a1*f + a2*g Identidad de Bezout
[gcd,a1,a2] = euclid_extended(a,b,Z)

gcd = euclid_u(a,b,Z) % 3


%% $$ Z(i) $$

z = 18-i
w = 11+7i

Zi = GaussIntegers;

gcd = euclid(z,w,Zi) % -i

% gcd = a1*f + a2*g Identidad de Bezout
%[gcd,a1,a2] = euclid_extended(z,w, zero, one, prod, minus, quo)

gcd = euclid_u(z,w,Zi) % 1

%% $$F_{q}[x] \quad q = 3^{1}$
% 
p = 3;
n = 1;

% field = gftuple([-1:p^n-2]',n,p);
% 
% zero = -Inf;
% rem = @(f,g) gfrem(f,g,field);

fqx = FiniteFieldPoly(p,n);

f = [-1 -1 1]; 
fprintf("f(x) = "); fqx.gfshow(fqx,f);
g = [1 1]; 
fprintf("g(x) = "); fqx.gfshow(fqx,g);

h = euclid(f,g,fqx); % 1
fprintf("h(x) = "); fqx.gfshow(fqx,h);

% gcd = a1*f + a2*g Identidad de Bezout
%[gcd,a1,a2] = euclid_extended(z,w, zero, one, prod, minus, quo)

%% $$F_{q}[x] \quad q = 3^{2}$
% 
p = 3;
n = 2;

% field = gftuple([-1:p^n-2]',n,p);
% 
% zero = -Inf;
% rem = @(f,g) gfrem(f,g,field);

fqx = FiniteFieldPoly(p,n);

f = [1 2 4]; 
fprintf("f(x) = "); fqx.gfshow(fqx,f);
g = [2 2]; 
fprintf("g(x) = "); fqx.gfshow(fqx,g);

h = euclid(f,g,fqx); % 2
fprintf("h(x) = "); fqx.gfshow(fqx,h);

% gcd = a1*f + a2*g Identidad de Bezout
%[gcd,a1,a2] = euclid_extended(z,w, zero, one, prod, minus, quo)


