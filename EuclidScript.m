%% Algoritmo de Euclides
% Algoritmo de Euclides 
%
% Algoritmo de Euclides Extendido: 
% $gcd = s*f + t*g$ (Identidad de Bezout) 
%
% Algoritmo de Euclides único 
%
% Algoritmo de Euclides Extendido único 
%

path(path, 'Algorithms');
path(path, 'Classes');
clear
%%  $$ Z $$
a = 24
b = -27

Z = Integers;

gcd = euclid(a,b,Z); % -3
fprintf("gcd(%i,%i) = %i\n",a,b,gcd);

[gcd,s,t] = euclid_extended(a,b,Z);
fprintf("%i = %i*%i + %i*%i\n",gcd,s,a,t,b);

gcd = euclid_u(a,b,Z); % 3
fprintf("gcdu(%i,%i) = %i\n",a,b,gcd);

[gcd,s,t] = euclid_extended_u(a,b,Z);
fprintf("%i = %i*%i + %i*%i\n",gcd,s,a,t,b);

%% $$ Z(i) $$

z = 18-i
w = 11+7i

Zi = GaussIntegers;

gcd = euclid(z,w,Zi); % -i
fprintf("gcd(%i%+ii,%i%+ii) = %i%+ii\n",real(z),imag(z), real(w), ...
    imag(w),real(gcd),imag(gcd));

[gcd,s,t] = euclid_extended(z,w, Zi);
fprintf("%i%+ii = (%i%+ii)*(%i%+ii) + (%i%+ii)*(%i%+ii)\n",real(gcd), ...
    imag(gcd), real(s),imag(s),real(z),imag(z),real(t),imag(t),real(w),imag(w));

gcd = euclid_u(z,w,Zi); % 1
fprintf("gcdu(%i%+ii,%i%+ii) = %i%+ii\n",real(z),imag(z), real(w), ...
    imag(w),real(gcd),imag(gcd));

[gcd,s,t] = euclid_extended_u(z,w, Zi);
fprintf("%i%+ii = (%i%+ii)*(%i%+ii) + (%i%+ii)*(%i%+ii)\n",real(gcd), ...
    imag(gcd), real(s),imag(s),real(z),imag(z),real(t),imag(t),real(w),imag(w));

%% $$F_{q}[x] \quad q = 3^{1}$
% 
p = 3;
n = 1;

fqx = FiniteFieldPoly(p,n);

f = [-Inf 1 1]; 
fprintf("f(x) = %s\n", fqx.gfshow(fqx,f));
g = [1 1]; 
fprintf("g(x) = %s\n", fqx.gfshow(fqx,g));

h = euclid(f,g,fqx); % 2 + 2x
fprintf("gcd(f(x),g(x)) = %s\n", fqx.gfshow(fqx,h));

[gcd,s,t] = euclid_extended(f,g,fqx);
fprintf("%s = (%s)*(%s) + (%s)*(%s)\n", fqx.gfshow(fqx,gcd), ...
    fqx.gfshow(fqx,s), fqx.gfshow(fqx,f), ...
    fqx.gfshow(fqx,t), fqx.gfshow(fqx,g));

gcd = euclid_u(f,g,fqx);
fprintf("gcdu(f(x),g(x)) = %s\n", fqx.gfshow(fqx,gcd));

[gcd,s,t] = euclid_extended_u(f,g,fqx);
fprintf("%s = (%s)*(%s) + (%s)*(%s)\n", fqx.gfshow(fqx,gcd), ...
    fqx.gfshow(fqx,s), fqx.gfshow(fqx,f), ...
    fqx.gfshow(fqx,t), fqx.gfshow(fqx,g));
%% $$F_{q}[x] \quad q = 3^{2}$
% 
p = 3;
n = 2;

fqx = FiniteFieldPoly(p,n);

f = [6 7 1]; 
fprintf("f(x) = %s\n", fqx.gfshow(fqx,f));
g = [1 2 4]; 
fprintf("g(x) = %s\n", fqx.gfshow(fqx,g));

h = euclid(f,g,fqx); % (0 + 1a) + (1 +2a)x + (2 +0a)x^2
fprintf("gcd(f(x),g(x)) = %s\n", fqx.gfshow(fqx,h));

[gcd,s,t] = euclid_extended(f,g,fqx);
fprintf("%s = [%s]*[%s] + [%s]*[%s]\n ", fqx.gfshow(fqx,gcd), ...
    fqx.gfshow(fqx,s), fqx.gfshow(fqx,f), ...
    fqx.gfshow(fqx,t), fqx.gfshow(fqx,g));

gcd = euclid_u(f,g,fqx); 
fprintf("gcdu(f(x),g(x)) = %s\n", fqx.gfshow(fqx,gcd));

[gcd,s,t] = euclid_extended_u(f,g,fqx);
fprintf("%s = [%s]*[%s] + [%s]*[%s]\n ", fqx.gfshow(fqx,gcd), ...
    fqx.gfshow(fqx,s), fqx.gfshow(fqx,f), ...
    fqx.gfshow(fqx,t), fqx.gfshow(fqx,g));