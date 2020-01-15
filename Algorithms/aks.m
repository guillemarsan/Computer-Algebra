function prime = aks(p,Z)
% PRIMALITY TEST AKS

len = floor(log10(p)) + 1;

% Step 1: if p = a^b for a,b in Z, return false. Dice en el libro que se
% puede usar el algoritmo de perfect power testing del ej 3.31 (vamos a
% complicarnos la vida pudiendo hacer un horrible bucle?)
for a=2:p
    aux = a * a;
    while (aux < p)
        aux = aux * a;
    end
    if (aux == p)
        prime = 0;
        return;
    end
end

% Step 2: find smallest r than verifies one of two conditions

r = 2;
cond1 = 0;
cond2 = 0;
while (cond1 == 0 && cond2 == 0)
    
    gcd = euclid(p,r,Z);
    if (gcd > 1)
        cond1 = 1;
        continue;
    elseif (gcd == 1)
        Zr = NIntegers(r);
        pr = mod(p,r);
        ord = 1;
        aux = pr;
        while (aux ~= Zr.one)
            aux = Zr.prod(Zr,aux,pr);
            ord = ord + 1;
        end
        if (ord > 4*(len^2))
            cond2 = 1;
            continue;
        end
    end
    r = r + 1;
end

% Step 3: A condition for true
if (r == p)
    prime = 1;
    return;
end

% Step 4: A condition for false
if (cond1 == 1)
    prime = 0;
    return;
end

% Step 5: A final crazy condition
for j=1:(2*len*floor(sqrt(r))+1)
    Zpx = FiniteFieldPoly(p,1);
    pol2 = ones(1,p+1) * Zpx.zero;
    pol2(1) = Zpx.elemintoexp(Zpx,j);
    pol2(p+1) = Zpx.one;
    aux = [pol2(1) Zpx.one];
    pol1 = Zpx.one;
    for i=1:p
        pol1 = Zpx.prod(Zpx,pol1,aux);
    end
    modu = ones(1,r+1) * Zpx.zero;
    modu(r+1) = Zpx.one;
    modu = Zpx.minus(Zpx,modu,Zpx.one);
    
    pol1 = Zpx.rem(Zpx,pol1,modu);
    pol2 = Zpx.rem(Zpx,pol2,modu);
    if (isequal(pol1,pol2))
        prime = 0;
        return;
    end
end

prime = 1;
end

