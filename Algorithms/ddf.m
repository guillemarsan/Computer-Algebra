function L = ddf(f,ff)
% DISTINCT DEGREE FACTORIZATION
L = {};
h = ff.rem(ff,[-Inf 0],f);
k = 0;
[p,n] = ff.gfgetpn(ff);
q = p^n;
while ~isequal(f,ff.one)
    hacum = ff.one;
    for i = 1:q 
        hacum = ff.prod(ff,hacum,h);
    end
    h = hacum;
    h = ff.rem(ff,h,f);
    k = k + 1;
    g = euclid_u(ff.minus(ff,h,[-Inf 0]),f,ff);
    if ~isequal(g,ff.one)
        L{end+1} = {g,k};
        f = ff.quo(ff,f,g);
        h = ff.rem(ff,h,f);
    end
end
end

