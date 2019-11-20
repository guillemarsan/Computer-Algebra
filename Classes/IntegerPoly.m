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
            r = obj.consolidate(obj,r);
        end
        function r = minus(obj,a,b)
            ad = length(a);
            bd = length(b);
            if ad > bd
              r = a - [zeros(1,ad-bd),b];
            else
              r = [zeros(1,bd-ad),a] - b;
            end
            r = obj.consolidate(obj,r);
        end
        function r = prod(obj,a,b) 
            r = conv(a,b);
            r = obj.consolidate(obj,r);
        end
        function r = quo(obj,a,b) 
            [r,~] = deconv(a,b);
            r = obj.consolidate(obj,r);
        end
        function r = rem(obj,a,b) 
            [~,r] = deconv(a,b);
            r = obj.consolidate(obj,r);
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
        function r = pp(obj,a)
            if (length(a) == 1)
                if (a == 0)
                    r = 0;
                else
                    r = 1;
                end
            else
                Z = Integers;
                gcd = euclid(a(1),a(2),Z);
                for i = 3:length(a)
                    gcd = euclid(gcd,a(i),Z); 
                end
                r = a / gcd;
            end
           
        end
        function s = polyshow(obj,a)
            deg = length(a);
            s = "";
            for i = deg:-1:1
                elem = abs(a(i));
                if (a(i) < 0)
                    s = strcat(s,"-",string(elem));
                elseif (i ~= deg)
                    s = strcat(s,"+",string(elem));
                else 
                    s = strcat(s,string(elem));
                end
                if (i > 1)
                    s = strcat(s,"x");
                end
                if (i>2)
                    s = strcat(s,"^",string(i-1));
                end
            end
        end
        function r = consolidate(obj,a)
            while (length(a) > 1 && a(1) == 0)
                a = a(2:length(a));
            end
            r = a;
        end
    end
end

