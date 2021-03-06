classdef Integers 
    properties (Constant)
        zero = 0;
        one = 1;
    end
    methods (Static)
        function r = add(obj,a,b) 
            r = a+b; 
        end
        function r = minus(obj,a,b) 
            r = a-b; 
        end
        function r = prod(obj,a,b) 
            r = a*b; 
        end
        function r = quo(obj,a,b) 
            r = fix(a/b); 
        end
        function r = rem(obj,a,b) 
            r = rem(a,b); 
        end
        function r = np(obj,a)
            r = abs(a);
        end
        function [r,s,t] = np_ext(obj,r,s,t)
            if (r < 0)
                r = -r;
                s = -s;
                t = -t;
            end
        end
    end
end