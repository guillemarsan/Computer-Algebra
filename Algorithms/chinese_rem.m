function x = chinese_rem(n,a,ed)
%  ALGORITMO CHINO DE LOS RESTOS
% 

N = ed.one;
k = size(n,1);
for i = 1:k
    N = ed.prod(ed,N,n{i});
end

for i = 1:k
    q{i} = ed.quo(ed,N,n{i});
    [~,s,~] = euclid_extended_u(q{i},n{i},ed);
    e{i}=ed.rem(ed,ed.prod(ed,s,a{i}),n{i});
      
end 

aux = ed.zero;
for i=1:k
    aux = ed.add(ed,aux,ed.prod(ed,e{i},q{i}));
end
x = aux;
end

