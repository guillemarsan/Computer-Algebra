function L = sfd(f,ff)
% SQUARE FREE DECOMPOSITION
L = {};
s = 1;
[p,~] = ff.gfgetpn(ff);
while ~isequal(f,ff.one)
    j = 1;
    gcd = euclid_u(f,ff.derivative(ff,f),ff);
    g = ff.quo(ff,f,gcd);
    while ~isequal(g,ff.one)
        f = ff.quo(ff,f,g);
        h = euclid_u(f,g,ff);
        m = ff.quo(ff,g,h);
        if ~isequal(m,ff.one)
            L{end+1} = {m,j*s};
        end    
        g = h;
        j = j+1;
    end
    if ~isequal(f,ff.one)
       f = pthroot(f,ff,p);
       s = p*s;
    end
end
end

function g = pthroot(f,ff,p)
    deg = length(f) - 1;
    [~,n] = ff.gfgetpn(ff);
    g = zeros(1,deg/p+1);
    for k = 1:p:deg
        acum = ff.one;
        for l = 1:p^(n-1)
            acum = ff.prod(ff,acum,f(k));
        end
        g(floor(k/p)+1) = acum;
    end
end

