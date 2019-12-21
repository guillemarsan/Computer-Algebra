function L = edf(f,k,ff)
% EQUAL DEGREE DECOMPOSITION
L = {f};
r = (length(f)-1)/k;
[p,n] = ff.gfgetpn(ff);
q = p^n;
while size(L) < r
   L2 = {};
   for i = 1:size(L)
       h = L{i};
       alpha = randi([-1 q-2],1,length(h));
       for j = 1:length(alpha)
           if alpha(j) == -1
               alpha(j) = -Inf;
           end
       end
       ff.consolidate(alpha);
       alpha = ff.rem(ff,alpha,h);
       repMk = ff.np(ff,computeMk(ff,alpha,k));
       d = euclid_u(repMk,h,ff);
       if isequal(d,ff.one) || isequal(d,h)
           L2{end+1} = h;
       else
           L2{end+1} = d;
           L2{end+1} = ff.quo(ff,h,d);
       end
   end
   L = L2;     
end
end

function Mk = computeMk(ff,alpha,k)
[p,n] = ff.gfgetpn(ff);
q = p^n;
if p > 2
    exp = (q^k - 1)/2;
    acum = ff.one;
    for i = 1:exp
        acum = ff.prod(ff,alpha,acum);
    end
    Mk = ff.minus(ff,acum,ff.one);
else 
    idx = n*k - 1;
    acum = ff.zero;
    aux = ff.one;
    alpha2 = ff.prod(ff,alpha,alpha);
    for j = 0:idx
        acum = ff.add(ff,acum,aux);
        aux = ff.prod(ff,aux,alpha2);
    end
    Mk = acum;
end
end
    
    
        
