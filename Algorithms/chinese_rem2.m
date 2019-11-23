function x = chinese_rem2(n,a,ed)
%  ALGORITMO CHINO DE LOS RESTOS
% 

N = ed.one;
k = size(n,1);
for i = 1:k
    N = ed.prod(ed,N,n{i});
end

for i = 1:k
    q = ed.quo(ed,N,n{i});
    b = ed.rem(ed,q,n{i});
    [~,~,t] = euclid_extended_u(n{i},b,ed);
    if t < 0
        t = ed.add(ed,t,n{i});
    end
    e{i} = ed.prod(ed,q,t);    
end 

aux = ed.zero;
for i=1:k
    aux = ed.add(ed,aux,ed.prod(ed,a{i},e{i}));
end
x = ed.rem(ed,aux,N);
end

