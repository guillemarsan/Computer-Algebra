function irr = ipt(f,ff)
%CHECK IF A POLYNOMIAL IS IRREDUCIBLE

[p,n] = ff.gfgetpn(ff);
q = p^n;
l = length(f)-1;

h = ff.rem(ff,[-Inf 0],f);
for k = 1:floor(l/2)
    acum = ff.one;
    for l = 1:q
        acum = ff.prod(ff,acum,h);
    end
    h = ff.rem(ff,acum,f);
    g = ff.minus(ff,h,[-Inf 0]);
    gcd = euclid_u(f,g,ff);
    if ~isequal(gcd,ff.one)
        irr = 0;
        return;
    end
end

irr = 1;

end
