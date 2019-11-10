
function gcd = euclid(f,g,ed)
%EUCLIDS ALGORITHM Summary of this function goes here
%   Detailed explanation goes here
while ~isequal(g,ed.zero)
    r = ed.rem(ed,f,g);
    f = g;
    g = r;
end
gcd = f;
end





