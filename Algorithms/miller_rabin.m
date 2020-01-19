function prime = miller_rabin(p,l)
% PRIMALITY TEST MILLER-RABIN

if p == 2
    prime = 1;
    return;
elseif mod(p,2)==0 
    prime = 0;
    return;
end

x = floor((p - 1)/2);
h = 1;
while mod(x,2)==0
    x = floor(x / 2);
    h = h + 1;
end
t = x;

prime = 1;
for a = 1:l
    i = randi(p-1);
    aux = 1;
    for k = 1:t
        aux = mod(aux*i,p);
    end
    b = aux;
    if b == 1
        continue;
    end
    
    for j = 0:h-1
        if b == p-1
            break;
        end
        if b == 1
            prime = 0;
            return;
        end
        b = mod(b^2,p);
        if j == h-1
            prime = 0;
            return;
        end
    end
end
end