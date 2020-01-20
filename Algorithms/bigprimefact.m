function G = bigprimefact(f,Zx)
% FACTORIZATION IN Z[x] (BIG PRIME VERSION)

n = length(f) - 1;
A = max(abs(f));
if (n == 1)
    G = {f};
    return;
end
b = Zx.lc(Zx,f);
B = sqrt(n+1) * 2^n * A * b;

gcd = -1;
while ~isequal(gcd,0)
    p = primes(4*B);
    p = p(p > (2*B));
    r = randi(length(p));
    p = p(r);
    
    f2 = mod(f,p);
    Fpx = FiniteFieldPoly(p,1);
    expf2 = Fpx.polintoexp(Fpx,fliplr(f2));
    expf2d = Fpx.derivative(Fpx,expf2);
    gcd = euclid_u(expf2,expf2d,Fpx);
end

L = modFact(f,b,p);


T = 1:length(L);
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
        g = mod(g,p);
        [m,j] = max(abs(g));
        while m > p/2
            g(j) = g(j) - p;
            [m,j] = max(g);
        end
        h = mod(h,p);
        [m,j] = max(abs(h));
        while m > p/2
            h(j) = h(j) - p;
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