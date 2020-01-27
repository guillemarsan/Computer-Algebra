%% Algoritmo de Euclides para P-adicos
%
% Algoritmo de Euclides para $Q_{p}[x]$
%
% 
%

path(path, 'Algorithms');
path(path, 'Classes');
clear
%%  $$ Q_{11} \: Ej1 $$
a = 48;
b = 24;
p = 11;

Qp = Padics(p);

fprintf("a = %s\n", Qp.padicsshow(Qp,a));
fprintf("b = %s\n", Qp.padicsshow(Qp,b));
gcd = euclid(a,b,Qp); % -3
fprintf("gcd(a,b) = %s\n",Qp.padicsshow(Qp,gcd));

%% $$ Q_{7} \: Ej2 $$

a = 181625/11;
b = 10555/2;
p = 7;

Qp = Padics(p);

fprintf("a = %s\n", Qp.padicsshow(Qp,a));
fprintf("b = %s\n", Qp.padicsshow(Qp,b));
gcd = euclid(a,b,Qp); % (-5/22) 
fprintf("gcd(a,b) = %s\n",Qp.padicsshow(Qp,gcd));
