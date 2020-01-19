function log = pollard_rho(base,elem,f,Fqx)
%POLLARD'S RHO LOGARITHM

[p,n] = Fqx.gfgetpn(Fqx);
q = p^n;
%Calculamos el orden de la base
N = 2;
x = Fqx.rem(Fqx,Fqx.prod(Fqx,base,base),f);
while (x ~= Fqx.one)
    x = Fqx.rem(Fqx,Fqx.prod(Fqx,x,base),f);
    N = N + 1;
end

%Floyd's cycle finding algorithm
x = Fqx.one;
a = 0;
b = 0;
X = x;
A = a;
B = b;
for i = 1:N
    [x,a,b] = func(x,a,b,base,elem,N,f,Fqx);
    [X,A,B] = func(X,A,B,base,elem,N,f,Fqx);
    [X,A,B] = func(X,A,B,base,elem,N,f,Fqx);
    if isequal(x,X)
        r = b-B;
        if (r == 0)
            log = nan;
            return;
        end
        ZNx = NIntegers(N);
        r = ZNx.np(ZNx,r);
        [gcd,rInv,~] = euclid_extended_u(r,N,ZNx);
        if (gcd ~= 1)
            log = nan;
            return;
        end
        log = mod(rInv*(A-a),N);
        return;
    end
end
log = nan;
end

function [x,a,b] = func(x,a,b,base,elem,N,f,Fqx)
s = x(1);
if (s == -Inf)
    s = -1;
end
s = mod(s+1,3);
% Hay que usar una función que divida el espacio en aproximadamente
% tres partes iguales y que no lleve el 1 al case 0 (bucle infinito)
switch (s)
    case 0
        x = Fqx.rem(Fqx,Fqx.prod(Fqx,x,x),f);
        a = mod(a*2,N);
        b = mod(b*2,N);
    case 1
        x = Fqx.rem(Fqx,Fqx.prod(Fqx,x,base),f);
        a = mod(a+1,N);
    case 2
        x = Fqx.rem(Fqx,Fqx.prod(Fqx,x,elem),f);
        b = mod(b+1,N);
end
end
