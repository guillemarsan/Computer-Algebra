%% Factorización en Z[X]
%
% Algoritmo de factorización big prime
% Algoritmo de factorización de Zassenhaus
% Factorizamos $f$ en $Z[x]$
%

path(path, 'Algorithms');
path(path, 'Classes');
warning('off','comm:gfprimdf:OutsideDatabase');
clear
%% $$Z[x] \: Ej1$ 
% 
Zx = IntegerPoly;

f = [1 0 -5 0 4]; % f(x) = 1x^4 + 0x^3 - 5x^2 + 0x + 4
fprintf("f(x) = %s\n", Zx.polyshow(Zx,f));

L = bigprimefact(f,Zx);

fprintf("f(x) = ");
len = length(L);
for i = 1:len
    fprintf("(%s)", Zx.polyshow(Zx,L{i})); % f(x) = (1x-1)(1x+2)(1x+1)(1x-2)
end
fprintf("\n");

L = zassenhaus(f,Zx);

fprintf("f(x) = ");
len = length(L);
for i = 1:len
    fprintf("(%s)", Zx.polyshow(Zx,L{i})); % f(x) = (1x-1)(1x+2)(1x+1)(1x-2)
end
fprintf("\n");


%% $$Z[x] \: Ej2$ 
% 
Zx = IntegerPoly;

f = [1 1 1 1]; % f(x) = 1x^3 + 1x^2 + 1x + 1
fprintf("f(x) = %s\n", Zx.polyshow(Zx,f));

L = bigprimefact(f,Zx);

fprintf("f(x) = ");
len = length(L);
for i = 1:len
    fprintf("(%s)", Zx.polyshow(Zx,L{i})); % f(x) = (1x^2+0x+1)(1x+1)
end
fprintf("\n");

L = zassenhaus(f,Zx);

fprintf("f(x) = ");
len = length(L);
for i = 1:len
    fprintf("(%s)", Zx.polyshow(Zx,L{i})); % f(x) = (1x-1)(1x+2)(1x+1)(1x-2)
end
fprintf("\n");


warning('on','comm:gfprimdf:OutsideDatabase');
