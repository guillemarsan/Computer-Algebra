function member = ideal_member(f,F,ffmp,order)
% IDEAL MEMBERSHIP ALGORITHM

G = buchberger(F,ffmp,order);
[~,r] = mult_div(f,G,ffmp,order);
if isequal(r,ffmp.zero)
    member = 1;
else 
    member = 0;
end
end
