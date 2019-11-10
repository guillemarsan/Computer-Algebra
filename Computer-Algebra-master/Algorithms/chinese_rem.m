function x = chinese_rem(n,a,ed)
%  ALGORITMO CHINO DE LOS RESTOS
% 

N = ed.one;
k = size(n,2);
for i = 1:k
    N = ed.prod(ed,N,n(i));
end

e = zeros(1,k);
for i = 1:k
    q = ed.quo(ed,N,n(i));
    b = ed.rem(ed,q,n(i));
    [~,~,t] = euclid_extended(n(i),b,ed);
    t = ed.np(ed,t);
    if t < 0
        t = ed.add(ed,t,n(i));
    end
    e(i) = ed.prod(ed,q,t);   
end 

aux = ed.zero;
for i=1:k
    aux = ed.add(ed,aux,ed.prod(ed,a(i),e(i)));
end

x = ed.rem(ed,aux,N);
end

