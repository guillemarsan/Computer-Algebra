function L = berlekamp(f,ff)
%FACTORIZACION BERLEKAMP
V = B1(f,ff);
L = B2(f,V,ff);
end

function V = B1(f,ff)
l = length(f) - 1;
[p,n] = ff.gfgetpn(ff);
q = p^n;
Q = ones(l,l)*ff.zero;
xi = ff.rem(ff,[-Inf 0],f);
acum = ff.one;
for i = 1:q
    acum = ff.prod(ff,acum,xi);
end
alpha = acum;
beta = ff.rem(ff,ff.one,f);
lb = length(beta);
for i = 1:l
    Q(i,1:lb) = beta;
    Q(i,i) = ff.minus(ff,Q(i,i),ff.one);
    beta = ff.rem(ff,ff.prod(ff,beta,alpha),f);
    lb = length(beta);
end
V = rownullspace(Q,l,ff);
end

function L = B2(f,V,ff)
L = {f};
r = size(V,1);
[p,n] = ff.gfgetpn(ff);
q = p^n;
while size(L) < r
   g = ff.zero;
   for i = 1:r
       c = randi([-1 q-2]);
       if c == -1
           c = -Inf;
       end
       g = ff.add(ff,g,ff.prod(ff,c,V(i,:)));
   end
   L2 = {};
   for i = 1:size(L,2)
       h = L{i};
       beta = ff.rem(ff,g,h);
       repM1 = ff.np(ff,computeMk(ff,beta,1));
       d = euclid_u(repM1,h,ff);
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

function V = rownullspace(Q,l,ff)
Id = ones(l,l)*-Inf;
Id(find(eye(l) == 1)) = 0;
M = [Q, Id];
r = 0;
for j = 1:l
    m = 0;
    i = r;
    fi = find(M(i+1:l,j) ~= ff.zero);
    if ~isempty(fi)
        m = fi(1)+i;
        r = r+1;
        M([r m],:) = M([m r],:);
        piv = M(r,j);
        for k = 1:2*l
            M(r,k) = ff.quo(ff,M(r,k),piv);
        end
        for n = 1:l
            if n ~= r
                aux = zeros(1,2*l);
                piv2 = M(n,j);
                for c = 1:2*l
                    aux = ff.prod(ff,piv2,M(r,c));
                    M(n,c) = ff.minus(ff,M(n, c),aux);
                end
            end
        end
    end              
end

cont = 1;
for ind = 1:l
    if isequal(M(ind,1:l),ones(1,l)*ff.zero)
        V(cont,:) = M(ind,l+1:2*l);
        cont = cont + 1;
    end
end  
end







% h = 1; 
% k = 1; 
% 
% while h <= l && k <= l
%     fi = find(Q(h:l,k) ~= ff.zero);
%     if isempty(fi)
%         k = k+1;
%     else
%         i_piv = fi(1)+h-1;
%         M([h i_piv],:) = M([i_piv h],:);
%         for i = (h+1):l
%             f = ff.quo(ff,M(i,k),M(h,k));
%             M(i, k) = ff.zero;
%             for j = (k+1):2*l
%                  M(i, j) = ff.minus(ff,M(i, j),ff.prod(ff,M(h, j),f));
%             end
%         end
%         h = h + 1;
%         k = k + 1;
%     end
% end

% cont = 1;
% for ind = 1:l
%     if isequal(M(ind,1:l),ones(1,l)*ff.zero)
%         V(cont,:) = M(ind,l+1:2*l);
%         cont = cont + 1;
%     end
% end
% end

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
    