function L = sfd(f,ff)
% SQUARE FREE DECOMPOSITION
L = {};
s = ff.one;
while(f ~= ff.one)
    j = 1;
    gcd = euclid_u(f,ff.derivative(ff,f),ff);
    g = ff.quo(ff,f,gcd);
    while g ~= ff.one
        f = ff.quo(ff,f,g);
        h = euclid_u(f,g,ff);
        m = ff.quo(ff,g,h);
        if m ~= ff.one
            L{end+1} = {m,j*s};
        end    
        g = h;
        j = j+1;
    end
    if f ~= ff.one 
       f = pthroot(f,ff,p);
       s = p*s;
    end
end
end

function f = pthroot(f,ff,p)
    deg = length(f);
    [~,n] = size(ff.field);
    for k = 1:deg
        for l = 1:p^(n-1)
            f(k) = ff.prod(f(k),f(k),ff);
        end
    end
end

