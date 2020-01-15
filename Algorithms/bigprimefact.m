function L = bigprimefact(f,Zx)
% FACTORIZATION IN Z[x] (BIG PRIME VERSION)

n = length(f) - 1;
A = max(abs(f));
if (n == 1)
    L = {f};
    return;
end
b = lc(Zx,f);
B = sqrt(n+1) * 2^n * A * b;

gcd = -1;
while (gcd ~= 0)
    p = primes(4*B);
    p = p(p >= (2*B));
    p = p(randperm(numel(p),1));
    f2 = mod(f,p);
    Fpx = FiniteFieldPoly(p,1);
    expf2 = Fpx.polintoexp(Fpx,f2);
    gcd = euclid_u(expf,expf2,Fpx);
end

end