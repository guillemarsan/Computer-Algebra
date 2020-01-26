%% Test de primalidad Miller-Rabin
%
% Dado $n$ determinamos si es primo
%

path(path, 'Algorithms');
path(path, 'Classes');
clear
%%  $$ Z $$

k = 100;

r = randi([1 100],1,5);

primes = primes(100);
idx = randi([1 length(primes)],1,1);
r(6) = primes(idx);

for i = 1:6
    prime = miller_rabin(r(i),k);
    if prime ~= 0
        fprintf("%i es primo\n", r(i));
    else
        fprintf("%i no es primo\n", r(i));
    end
end
