classdef Padics
    properties (Constant)
        zero = 0;
        one = 1;
    end
    properties
        p;
    end
    methods (Static)
        function obj = Padics(p)
            obj.p = p;
        end
        function r = val(obj,a)
            r1 = 0;
            r2 = 0;
            
            [a,b] = rat(a);
            
            while rem(a,obj.p)==0
                r1 = r1+1;
                a = a/obj.p;
            end
            if r1>0
                r=r1;
            else
                
                while rem(b,obj.p)==0
                    r2 = r2+1;
                    b = b/obj.p;
                end
                
                r = -r2;
            end
            
        end
        
        function r = abs(obj,a)
            [a,b] = rat(a);
            n = obj.val(obj,b)-obj.val(obj,a);
            r = (obj.p)^n;
        end
        function [d,r] = quo(obj,a,b)
            a_val = obj.val(obj,a);
            b_val = obj.val(obj,b);
            
            p=obj.p;
            
            if obj.abs(obj,a) < obj.abs(obj,b)
                d = 0; r = a;
            else
                s = a/(p^a_val);
                t = b/(p^b_val);
                [s1,s2] = rat(s);
                [t1,t2] = rat(t);
                p2 = p^(b_val - a_val+1);
                
                q1 = rem(s1*t2,p2);
                q2 = rem(s2*t1,p2);
                NI = NIntegers(p2);
                [~,q2inv,~] = euclid_extended_u(q2,p2,NI);
                if q2 < 0
                    q2inv = q2inv-p2;
                end
                d = rem(q1*q2inv,p2);
                d = d*p^(a_val-b_val);
                r = s*p^(a_val)-d*t*p^(b_val);
                if abs(r) <= 1e-10
                    r = 0;
                end
            end
        end
        function r = rem(obj,a,b)
            [~,r] = obj.quo(obj,a,b);
        end
        function s = padicsshow(obj,n)
            s = "";
            if fix(n) == n % Integer
                u = n;
                i = 0;
                while u ~= 0
                    c = mod(u/(obj.p^i),obj.p);
                    if c > obj.p/2
                        c = c - obj.p;
                    end
                    u = (u - c*obj.p^i);
                    if s ~= ""
                        s = strcat(s," + ");
                    end
                    s = strcat(s,"(",string(c),")*",string(obj.p),"^",string(i)); 
                    i = i+1;
                end
            else % Rational
                [q1,q2] = rat(n);
                v1 = obj.val(obj,q1);
                v2 = obj.val(obj,q2);
                s = strcat(s,"(",string(q1/obj.p^v1),"/", ...
                        string(q2/obj.p^v2),")*",string(obj.p),"^",string(v1-v2));
            end
        end
    end
end