function inv = inverse(g,f,Zpx)
%INVERSE IN A FIELD


[gcd,s,~] = euclid_extended(g,f,Zpx);
aux = Zpx.quo(Zpx,s,gcd);
inv = Zpx.rem(Zpx,aux,f);
end

