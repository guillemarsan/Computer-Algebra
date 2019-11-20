
function gcd = euclid_primitive(f,g,ufd)
%EUCLIDS ALGORITHM Summary of this function goes here
%   Detailed explanation goes here

fd = length(f);
gd = length(g);

while ~isequal(g,ufd.zero)
    a = ufd.prod(ufd,f,ufd.lc(ufd,g)^(1+fd-gd));
    r = ufd.pp(ufd,ufd.rem(ufd,a,g));
    
    f = g;
    g = r;
    fd = gd;
    gd = length(r);
end
gcd = ufd.np(ufd,f);
end

