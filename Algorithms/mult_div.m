function [Q,r] = mult_div(f,F,ffmp,order)
s = length(F);
r = ffmp.zero;
p = f;
for i = 1:s
    Q{i} = ffmp.zero;
end

while ~isequal(p,ffmp.zero)
    divisible = 0;
    ltp = ffmp.lt(ffmp,p,order);
    for j = 1:s
        ltf = ffmp.lt(ffmp,F{j},order);
        [div,rem] = ffmp.mon_quo(ffmp,ltp,ltf);
        if isequal(rem,ffmp.zero)
            divisible = 1;
            break;
        end
    end
    if(divisible)
        Q{j} = ffmp.add(ffmp,Q{j},div);
        aux = ffmp.prod(ffmp,div,F{j});
        p = ffmp.minus(ffmp,p,aux);
    else
        r = ffmp.add(ffmp,r,ltp);
        p = ffmp.minus(ffmp,p,ltp); 
    end
end
end
        
