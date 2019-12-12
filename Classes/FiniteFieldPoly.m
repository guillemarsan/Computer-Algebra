classdef FiniteFieldPoly
    properties
        field;
    end
    properties (Constant)
        zero = -Inf;
        one = 0;
    end
    methods
        function obj = FiniteFieldPoly(p,n)
            obj.field = gftuple((-1:p^n-2)',n,p);
        end
    end
    methods (Static)
        function r = add(obj,f,g) 
            r = gfadd(f,g,obj.field);
            r = obj.consolidate(r);
        end
        function r = minus(obj,f,g) 
            r = gfsub(f,g,obj.field); 
            r = obj.consolidate(r);
        end
        function r = prod(obj,f,g) 
            r = gfconv(f,g,obj.field);
            r = obj.consolidate(r);
        end
        function r = quo(obj,f,g) 
            [r,~] = gfdeconv(f,g,obj.field); 
            r = obj.consolidate(r);
        end
        function r = rem(obj,f,g) 
            [~,r] = gfdeconv(f,g,obj.field);
            r = obj.consolidate(r);
        end
        function r = np(obj,f)
            j = length(f);
            a = f(j);
            r = obj.quo(obj,f,a);
        end
        function [r,s,t] = np_ext(obj,f,s,t)
            j = length(f);
            a = f(j);
            r = obj.quo(obj,f,a);
            s = obj.quo(obj,s,a);
            t = obj.quo(obj,t,a);
        end
        function r = consolidate(r)
            j = length(r);
            while j ~= 1 && r(j) == -Inf
                r = r(1:j-1);
                j = j - 1;
            end
        end
        function df = derivative(obj,f)
            deg = length(f);
            i = 2;
            df = [];
            alpha = obj.field(3);
            while(i < deg + 1)
                aux = obj.zero;
                for j = 1:i-1
                    aux = obj.add(obj,aux,f(i));
                end
                df = [df aux];
                i=i+1;
            end
            df = obj.consolidate(df);
        end
        function elem = gftrans(obj,n)
            if n < 0
                elem = obj.field(1,:);
            else 
                elem = obj.field(n+2,:);
            end
        end
        function [p,n] = gfgetpn(obj)
            [rs,n] = size(obj.field);
            p = nthroot(rs,n);
        end
        function s = gfshow(obj,f)
        %   Muestra los polinomios pasados de forma exponencial a su equivalente en
        %   (Zp)^n
            n = size(obj.field,2);
            deg = length(f);
            if (n == 1) % Zp
                for i = 1:deg
                    elem = obj.gftrans(obj,f(i));
                    if(i == 1)
                        s = string(elem);
                    elseif (i == 2)
                        s = strcat(s," + ",string(elem),"x");
                    else
                        s = strcat(s," + ",string(elem),"x^",string(i-1));
                    end
                end
            else % (Zp)^n
                for i = 1:deg
                    elem = obj.gftrans(obj,f(i));
                    elemstr = "(";
                    for j=1:length(elem)
                       if (j == 1)
                           elemstr = strcat(elemstr,string(elem(j)));
                       elseif (j == 2)
                           elemstr = strcat(elemstr," + ",string(elem(j)),"a");
                       else
                           elemstr = strcat(elemstr," + ",string(elem(j)),"a^",string(j-1));
                       end
                    end
                    elemstr = strcat(elemstr,")");

                    if(i == 1)
                        s = strcat(elemstr);
                    elseif (i == 2)
                        s = strcat(s," + ",elemstr,"x");
                    else
                        s = strcat(s," + ",elemstr,"x^",string(i-1));
                    end
                end
            end
        end
    end
end
