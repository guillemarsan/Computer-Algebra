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
            r = round(real(z/w)) + i*round(imag(z/w)); 
        end
        function r = rem(obj,z,w) 
            aux = z/w;
            q = round(real(aux)) + i*round(imag(aux));
            r = z - q*w;
        end
        function r = np(obj,z)
            if real(z)==0
               r = abs(imag(z));
            else
               r = abs(real(z))+ i*abs(imag(z));
            end  
        end
    end
end
