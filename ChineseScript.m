%% Algoritmo Chino de los Restos
% $U = A \, mod \, N$
%
% Algoritmo Chino de los Restos version 1
%
% Algoritmo Chino de los Restos version 2

path(path, 'Algorithms');
path(path, 'Classes');
clear
%%  $$ Z $$
n = {9; 10; 11};
a = {5; 1; 4};

Z = Integers;

for j = 1:size(n,1)
    fprintf("u = %i mod %i\n", a{j},n{j});
end

u = chinese_rem(n,a,Z);  %-1129
fprintf("\nu = %i\n", u); 

u = chinese_rem2(n,a,Z);  %851
fprintf("\nu = %i\n", u); 


%% $$ Z(i) $$

n = {7+2i; 7};
a = {5+i; 3};


Zi = GaussIntegers;

for j = 1:size(n,1)
    fprintf("u = %i%+ii mod %i%+ii\n", real(a{j}), imag(a{j}), ...
                    real(n{j}), imag(n{j}));
end

u = chinese_rem(n,a,Zi); %-25
fprintf("\nu = %i%+ii\n", real(u),imag(u));

u = chinese_rem2(n,a,Zi);
fprintf("\nu = %i%+ii\n", real(u),imag(u));


%% $$F_{q}[x] \quad q = 3^{1}$
% 
p = 3;
n = 1;

fqx = FiniteFieldPoly(p,n);

n = {[1 1 0];[-Inf 1 1]};
a = {[-Inf 1];[0 1]};

for j = 1:size(n,1)
    fprintf("u = (%s) mod (%s)\n", fqx.gfshow(fqx,a{j}), fqx.gfshow(fqx,n{j}));
end


u = chinese_rem(n,a,fqx); % 1 + 2x + x^2 + x^3
fprintf("u(x) = %s\n", fqx.gfshow(fqx,u));

u = chinese_rem2(n,a,fqx);
fprintf("u(x) = %s\n", fqx.gfshow(fqx,u));

%% $$F_{q}[x] \quad q = 3^{2}$
% 
p = 3;
n = 2;

fqx = FiniteFieldPoly(p,n);

n = {[1 3];[-Inf 0]};
a = {[3];[5]};

for j = 1:size(n,1)
    fprintf("u = (%s) mod (%s)\n", fqx.gfshow(fqx,a{j}), fqx.gfshow(fqx,n{j}));
end


u = chinese_rem(n,a,fqx); % 2a + (1+2a)x
fprintf("u(x) = %s\n", fqx.gfshow(fqx,u));

u = chinese_rem2(n,a,fqx);
fprintf("u(x) = %s\n", fqx.gfshow(fqx,u));