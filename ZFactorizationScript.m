%% Factorización en Z[X]
%

path(path, 'Algorithms');
path(path, 'Classes');
clear
%% $$Z[x]$ 
% 
Zx = IntegerPoly;

f = [1 0 -5 0 4]; % f(x) = 1x^4 + 0x^3 - 5x^2 + 0x+4
fprintf("f(x) = %s\n", Zx.polyshow(Zx,f));

L = bigprimefact(f,Zx);

fprintf("f(x) = ");
len = length(L);
for i = 1:len
    fprintf("(%s)", Zx.polyshow(Zx,L{i})); % f(x) = (1x-1)(1x+2)(1x+1)(1x-2)
end
fprintf("\n");

%% $$Z[x]$ 
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
