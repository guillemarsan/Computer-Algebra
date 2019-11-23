classdef GaussIntegers 
    properties (Constant)
        zero = 0;
        one = 1;
    end
    methods (Static)
        function r = add(obj,z,w) 
            r = z+w; 
        end
        function r = minus(obj,z,w) 
            r = z-w; 
        end
        function r = prod(obj,z,w) 
            r = z*w; 
        end
        function r = quo(obj,z,w) 
            r = round(z/w); 
        end
        function r = rem(obj,z,w) 
            aux = z/w;
            q = round(aux);
            r = z - q*w;
        end
        function z = np(obj,z)
            if real(z) <= 0 && imag(z) > 0
               z = z*(-i);
            elseif real(z) < 0 && imag(z) <= 0
                z = z*(-1);
            elseif real(z) >= 0 && imag(z) < 0 
                z = z*i;
            end  
        end
        function [z,s,t] = np_ext(obj,z,s,t)
            if real(z) <= 0 && imag(z) > 0
                z = z*(-i);
                s = s*(-i);
                t = t*(-i);
            elseif real(z) < 0 && imag(z) <= 0
                z = z*(-1);
                s = s*(-1);
                t = t*(-1);
            elseif real(z) >= 0 && imag(z) < 0
                z = z*i;
                s = s*i;
                t = t*i;
            end  
        end
    end
end
