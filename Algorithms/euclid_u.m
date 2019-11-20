function gcd = euclid_u(f,g, ed)
% np coge un representante de la clase de equivalencia por la relacion de asociados
a = f; % np????
b = g;
gcd = ed.np(ed,euclid(a,b,ed));
end
