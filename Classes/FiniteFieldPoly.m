classdef FiniteFieldPoly
    properties
        field;
    end
    properties (Constant)
        zero = -Inf;
        one = 1;
    end
    methods
        function obj = FiniteFieldPoly(p,n)
            obj.field = gftuple((-1:p^n-2)',n,p);
        end
    end
    methods (Static)
        function r = add(obj,f,g) 
            r = f+g; 
        end
        function r = minus(obj,f,g) 
            r = f-g; 
        end
        function r = prod(obj,f,g) 
            r = z*w; 
        end
        function r = quo(obj,f,g) 
            r = round(real(z/w)) + i*round(imag(z/w)); 
        end
        function r = rem(obj,f,g) 
            [~,r] = gfdeconv(f,g,obj.field);
        end
        function r = np(obj,f)
            if real(z)==0
               r = abs(imag(z));
            else
               r = abs(real(z))+ i*abs(imag(z));
            end  
        end
        function gfshow(obj,f)
        %   Muestra los polinomios pasados de forma exponencial a su equivalente en
        %   (Zp)^n
            n = size(obj.field,2);
            deg = size(f,2);
            if (n == 1) % Zp
                for i = 1:deg
                    if f(i) < 0
                        elem = obj.field(1);
                    else 
                        elem = obj.field(f(i)+2);
                    end
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
                    if f(i) < 0
                        elem = obj.field(1,:);
                    else 
                        elem = obj.field(f(i)+2,:);
                    end

                    elemstr = "(";
                    for j=1:size(elem,2)
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
            fprintf('%s\n',s);
        end
    end
end
