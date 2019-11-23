function [gcd,a1,a2] = euclid_extended_u(f,g,ed)
% np coge un representante de la clase de equivalencia por la relacion de asociados
a = f;
b = g;
[gcd,a1,a2] = euclid_extended(a,b,ed);
[gcd,a1,a2] = ed.np_ext(ed,gcd,a1,a2);

end

