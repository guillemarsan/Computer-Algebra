classdef IntegerPoly 
    properties (Constant)
        zero = 0;
        one = 1;
    end
    methods (Static)
        function r = add(obj,a,b)
            ad = length(a);
            bd = length(b);
            if ad > bd
              r = a + [zeros(1,ad-bd),b];
            else
              r = b + [zeros(1,bd-ad),a];
            end
            r = obj.consolidate(r);
        end
        function r = minus(obj,a,b)
            ad = length(a);
            bd = length(b);
            if ad > bd
              r = a - [zeros(1,ad-bd),b];
            else
              r = [zeros(1,bd-ad),a] - b;
            end
            r = obj.consolidate(r);
        end
        function r = prod(obj,a,b) 
            r = conv(a,b);
            r = obj.consolidate(r);
        end
        function r = quo(obj,a,b) 
            [r,~] = deconv(a,b);
            r = obj.consolidate(r);
        end
        function r = rem(obj,a,b) 
            [~,r] = deconv(a,b);
            r = obj.consolidate(r);
        end
        function [q,r] = mon_quo(obj,a,b)
            r = a;
            n = length(a)-1;
            m = length(b)-1;
            if n < m
                q = [0];
            else
                q = zeros(1,n-m+1);
                for i = 1:n-m+1
                    degr = length(r)-1;
                    if degr == n+(1-i)
                        q(i) = obj.lc(obj,r);
                        pol = zeros(1,i+1);
                        pol(1) = q(i);
                        r = obj.minus(obj,r,obj.prod(obj,pol,b));
                    else
                        q(i) = 0;
                    end
                end
            end
        end
        function r = lc(obj,a)
            r = a(1);
        end
        function r = np(obj,a)
            if (a(1) < 0)
                r = -a;
            else
                r = a;
            end
        end
        function [r,s,t] = np_ext(obj,a,s,t)
            if (a(1) < 0)
                r = -a;
                s = -s;
                t = -t;
            else
                r = a;
            end
        end
        function r = pp(obj,a)
            if (length(a) == 1)
                if (a == 0)
                    r = 0;
                else
                    r = 1;
                end
            else
                Z = Integers;
                gcd = euclid_u(a(1),a(2),Z);
                for i = 3:length(a)
                    gcd = euclid_u(gcd,a(i),Z); 
                end
                r = a / gcd;
            end
           
        end
        function r = consolidate(r)
            while (length(r) > 1 && r(1) == 0)
                r = r(2:length(r));
            end
        end
        function s = polyshow(obj,a)
            l = length(a);
            s = "";
            for i = 1:l
                elem = abs(a(i));
                if (a(i) < 0)
                    s = strcat(s,"-",string(elem));
                elseif (i ~= 1)
                    s = strcat(s,"+",string(elem));
                else 
                    s = strcat(s,string(elem));
                end
                if (i < l)
                    s = strcat(s,"x");
                end
                if (i < l-1)
                    s = strcat(s,"^",string(l-i));
                end
            end
        end
    end
end

