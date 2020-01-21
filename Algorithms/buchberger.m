function F = buchberger(F,ffmp,order)

t = length(F);
while(1)
    S = {};
    for i = 1:t-1
        for j = (i+1):t
            Spol = S_pol(F{i},F{j},ffmp,order);
            [~,r] = mult_div(Spol,F,ffmp,order);
            if ~isequal(r,ffmp.zero)
                S{end+1} = r;
            end
        end
    end
    if isempty(S)
        return;
    else
        for i = 1:length(S)
            F{end+1} = S{i};
        end
        t = length(F);
    end
end
end

function Spol = S_pol(g,h,ffmp,order)
ltg = ffmp.lt(ffmp,g,order);
lth = ffmp.lt(ffmp,h,order);
gamma = ffmp.zero;
gamma{1}(1) = 1;
for k = 2:max(length(ltg{1}),length(lth{1}))
    if ltg{1}(k) < lth{1}(k)
        gamma{1}(k) = lth{1}(k);
    else
        gamma{1}(k) = ltg{1}(k);
    end
end
fact1 = ffmp.mon_quo(ffmp,gamma,ltg);
fact1 = ffmp.prod(ffmp,fact1,g);
fact2 = ffmp.mon_quo(ffmp,gamma,lth);
fact2 = ffmp.prod(ffmp,fact2,h);
Spol = ffmp.minus(ffmp,fact1,fact2);
end


