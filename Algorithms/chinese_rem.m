function x = chinese_rem(n,a,zero, one, sum, minus, prod, quo, rem)
%  ALGORITMO CHINO DE LOS RESTOS
% 

N = one;
k = size(n,2);
for i = 1:k
    prod(N,n(i));
end

e = zeros(1,k);
for i = 1:k
    q = quo(N,n(i));
    b = rem(q,n(i));
    [~,~,t] = euclid_extended(n(i),b,zero, one, prod, minus, quo);
    if t < 0
        t = sum(t,n(i));
    end
    e(i) = prod(q,t);   
end 

aux = zero;
for i=1:k
    aux = sum(aux,prod(a(i),e(i)));
end

x = rem(aux,N);
end

