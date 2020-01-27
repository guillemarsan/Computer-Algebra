%% Test de primalidad AKS
%
% Dado $n$ determinamos si es primo
%

path(path, 'Algorithms');
path(path, 'Classes');
clear
%%  $$ Z $$

Z = Integers;

r = randi([1 100],1,5);

primes = primes(100);
idx = randi([1 length(primes)],1,1);

r(6) = primes(idx);

for i = 1:6
    prime = aks(r(i),Z);
    if prime ~= 0
        fprintf("%i es primo\n", r(i));
    else
        fprintf("%i no es primo\n", r(i));
    end
end

