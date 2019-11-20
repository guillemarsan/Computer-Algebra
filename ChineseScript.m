%% Algoritmo Chino de los Restos
%
% 
%

path(path, 'Algorithms');
path(path, 'Classes');
clear
%%  $$ Z $$
n = [9 10 11];
a = [5 1 4];

for j = 1:size(n,2)
    fprintf("u = %i mod %i\n", a(j),n(j));
end

Z = Integers;

u = chinese_rem(n,a,Z);
fprintf("\nu = %i\n", u);


%% $$ Z(i) $$

n = [7+2i 7];
a = [5+i 3];

for j = 1:size(n,2)
    fprintf("u = %i%+ii mod %i%+ii\n", real(a(j)), imag(a(j)), ...
                    real(n(j)), imag(n(j)));
end

Zi = GaussIntegers;

u = chinese_rem(n,a,Zi);
fprintf("\nu = %i%+ii\n", real(u),imag(u));


%% $$F_{q}[x] \quad q = 3^{1}$
% 
p = 3;
n = 1;

fqx = FiniteFieldPoly(p,n);

f = [-Inf 1 1]; 
fprintf("f(x) = %s\n", fqx.gfshow(fqx,f));
g = [1 1]; 
fprintf("g(x) = %s\n", fqx.gfshow(fqx,g));

h = euclid(f,g,fqx); 
fprintf("gcd(f(x),g(x)) = %s\n", fqx.gfshow(fqx,h));

[gcd,s,t] = euclid_extended(f,g,fqx);
fprintf("%s = (%s)*(%s) + (%s)*(%s)\n ", fqx.gfshow(fqx,gcd), ...
    fqx.gfshow(fqx,s), fqx.gfshow(fqx,f), ...
    fqx.gfshow(fqx,t), fqx.gfshow(fqx,g));

gcd = euclid_u(f,g,fqx);
fprintf("gcdu(f(x),g(x)) = %s\n", fqx.gfshow(fqx,gcd));
%% $$F_{q}[x] \quad q = 3^{2}$
% 
p = 3;
n = 2;

fqx = FiniteFieldPoly(p,n);

f = [6 7 1]; 
fprintf("f(x) = %s\n", fqx.gfshow(fqx,f));
g = [1 2 4]; 
fprintf("g(x) = %s\n", fqx.gfshow(fqx,g));

h = euclid(f,g,fqx); 
fprintf("gcd(f(x),g(x)) = %s\n", fqx.gfshow(fqx,h));

[gcd,s,t] = euclid_extended(f,g,fqx);
fprintf("%s = [%s]*[%s] + [%s]*[%s]\n ", fqx.gfshow(fqx,gcd), ...
    fqx.gfshow(fqx,s), fqx.gfshow(fqx,f), ...
    fqx.gfshow(fqx,t), fqx.gfshow(fqx,g));

gcd = euclid_u(f,g,fqx);
fprintf("gcdu(f(x),g(x)) = %s\n", fqx.gfshow(fqx,gcd));