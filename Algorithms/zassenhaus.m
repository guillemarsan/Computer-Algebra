function G = zassenhaus(f,Zx)
% FACTORIZATION IN Z[x] (ZASSENHAUS)

n = length(f) - 1;
if (n == 1)
    G = {f};
    return;
end
A = max(abs(f));
b = Zx.lc(Zx,f);
B = sqrt(n+1) * 2^n * A * b;
C = (n+1)^(2*n) * A^(2*n-1);
gamma = ceil(2*log2(C));

r = 1;
gcd = 1;
while(isequal(r,0) || ~isequal(gcd,0))
    p = primes(2*gamma*log(gamma));
    idx = randi(length(p));
    p = p(idx);
    r = mod(b,p);
   
    f2 = mod(f,p);
    Fpx = FiniteFieldPoly(p,1);
    expf2 = Fpx.polintoexp(Fpx,fliplr(f2));
    expf2d = Fpx.derivative(Fpx,expf2);
    gcd = euclid_u(expf2,expf2d,Fpx);
end
l = ceil(log(2*B+1)/log(p));

L = modFact(f,b,p);

H = hensel_lifting(Zx,f,L,p,l);

T = 1:length(H);
s = 1;
G = {};
f2 = f;

while 2*s <= length(T)
    cont = 0;
    S = combnk(T,s);
    
    for k = 1:size(S,1)
        comb = S(k,:);
        g = b;
        h = b;
        for i = 1:length(T)
            if find(comb == T(i))
                g = Zx.prod(Zx,g,L{T(i)});
            else
                h = Zx.prod(Zx,h,L{T(i)});
            end
        end
        g = mod(g,p^l);
        [m,j] = max(abs(g));
        while m > (p^l)/2
            g(j) = g(j) - (p^l);
            [m,j] = max(g);
        end
        h = mod(h,p^l);
        [m,j] = max(abs(h));
        while m > p/2
            h(j) = h(j) - (p^l);
            [m,j] = max(h);
        end
        if norm(g,1)*norm(h,1)<= B
            T = setdiff(T,comb);
            G{end+1} = Zx.pp(Zx,g);
            f = Zx.pp(Zx,h);
            b = Zx.lc(Zx,f);
            cont = 1;
            break;
        end
    end
    
    if(~cont)
        s = s + 1;
    end
end

G{end+1} = f;

end

function fact = modFact(f,b,p)
Zpx = FiniteFieldPoly(p,1);
f = mod(f,p);
b = mod(b,p);
f = Zpx.polintoexp(Zpx,fliplr(f));
f = Zpx.quo(Zpx,f,b);
fact = berlekamp(f,Zpx);
b = 1;
for i=1:length(fact)
    g = fact{i};
    b = b * Zpx.gftrans(Zpx,g(length(g)));
    g = Zpx.quo(Zpx,g,g(length(g)));
    g = arrayfun(@(x) Zpx.gftrans(Zpx,x),g);
    [m,j] = max(abs(g));
    while m > p/2
        g(j) = g(j) - p;
        [m,j] = max(g);
    end
    fact{i} = fliplr(g);
end
end

function H = hensel_lifting(Zx,f,L,p,l)
b = Zx.lc(Zx,f);
if length(L) == 1
    Zpl = NIntegers(p^l);
    inb = inverse(b,0,Zpl);
    f2 = Zpl.prod(Zpl,f,inb);
    H = {f2};
    return;
end

r = length(L);
k = floor(r/2);
d = ceil(log2(l));


L1 = {};
L2 = {};
g = b;
h = Zx.one;
for i = 1:k
    g = Zx.prod(Zx,g,L{i});
    g = mod(g,p);
    L1{end+1} = L{i};
end
for i = (k+1):r
    h = Zx.prod(Zx,h,L{i});
    h = mod(h,p);
    L2{end+1} = L{i};
end

Zpx = FiniteFieldPoly(p,1);
gexp = Zpx.polintoexp(Zpx,fliplr(g));
hexp = Zpx.polintoexp(Zpx,fliplr(h));
[~,s,t] = euclid_extended_u(gexp,hexp,Zpx);
s = arrayfun(@(x) Zpx.gftrans(Zpx,x),s);
t = arrayfun(@(x) Zpx.gftrans(Zpx,x),t);

for j = 1:d
    [ng,nh,ns,nt] = hensel_step(p^(2^(j-1)),f,g,h,s,t);
    g = ng;
    h = nh;
    s = ns;
    t = nt;
end

H1 = hensel_lifting(Zx,g,L1,p,l);
H2 = hensel_lifting(Zx,h,L2,p,l);

H = {};
for i = 1:length(H1)
    H{end+1} = H1{i};
end
for i = 1:length(H2)
    H{end+1} = H2{i};
end

end


function [ng,nh,ns,nt] = hensel_step(m,f,g,h,s,t)
Zx = IntegerPoly;
e = Zx.minus(Zx,f,Zx.prod(Zx,g,h));
e = mod(e,m^2);
[q,r] = Zx.mon_quo(Zx,Zx.prod(Zx,s,e),h);
q = mod(q,m^2); r = mod(r,m^2);
ng = Zx.add(Zx,g,Zx.prod(Zx,t,e));
ng = Zx.add(Zx,ng,Zx.prod(Zx,q,g));
ng = mod(ng,m^2);
nh = Zx.add(Zx,h,r);
nh = mod(nh,m^2);

b = Zx.minus(Zx,Zx.prod(Zx,s,ng),Zx.one);
b = Zx.add(Zx,Zx.prod(Zx,t,nh),b);
b = mod(b,m^2);
 [c,d] = Zx.mon_quo(Zx,Zx.prod(Zx,s,b),nh);
c = mod(c,m^2); d = mod(d,m^2);
ns = Zx.minus(Zx,s,d);
ns = mod(ns,m^2);
nt = Zx.minus(Zx,t,Zx.prod(Zx,c,ng));
nt = Zx.minus(Zx,nt,Zx.prod(Zx,t,b));
nt = mod(nt,m^2);
end  

