
function [gcd,a1,a2] = euclid_extended(f,g, ed)
%EUCLIDS ALGORITHM Summary of this function goes here
%   Detailed explanation goes here

a1 = ed.one;
a2 = ed.zero;
b1 = ed.zero;
b2 = ed.one;

while ~isequal(g,ed.zero)
    q = ed.quo(ed,f,g);
    r = ed.minus(ed,f,ed.prod(ed,q,g));
    r1 = ed.minus(ed,a1,ed.prod(ed,q,b1));
    r2 = ed.minus(ed,a2,ed.prod(ed,q,b2));
    f = g; a1 = b1; a2 = b2;
    g = r; b1 = r1; b2 = r2;
end
gcd = f;
end