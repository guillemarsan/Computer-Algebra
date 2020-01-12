classdef NIntegers 
    properties
        n = 0;
    end
    properties (Constant)
        zero = 0;
        one = 1;
    end
    methods
        function obj = NIntegers(n)
            obj.n = n;
        end
    end
    methods (Static)
        function r = add(obj,a,b)
            r = mod(a+b,obj.n);
        end
        function r = minus(obj,a,b)
            r = mod(a-b,obj.n); 
        end
        function r = prod(obj,a,b) 
            r = mod(a*b,obj.n); 
        end
        function r = quo(obj,a,b) 
            r = mod(fix(a/b),obj.n); 
        end
        function r = rem(obj,a,b) 
            r = mod(rem(a,b),obj.n); 
        end
        function r = np(obj,a)
            r = mod(a,obj.n);
        end
        function [r,s,t] = np_ext(obj,r,s,t)
            r = mod(r,obj.n);
            s = mod(s,obj.n);
            t = mod(t,obj.n);
        end
    end
end