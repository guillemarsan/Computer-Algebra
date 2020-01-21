classdef FiniteFieldMultiPoly
    properties
        field;
        zero;
        one;
        variables;
    end
    methods
   
        function obj = FiniteFieldMultiPoly(F,n)
            obj.field = F;
            variables = n;
            obj.zero = {[F.zero, zeros(1,n)]};
            obj.one = {[F.one, zeros(1,n)]};
        end
    end
    methods (Static)
        function r = add(obj,a,b)
            r = {};
            for i = 1:length(a)
                r{end+1} = a{i};
            end
            for j = 1:length(b)
                r{end+1} = b{j};
            end
            r = obj.consolidate(obj,r);
         end
        
        function r = minus(obj,a,b)
            r = {};
            for i = 1:length(a)
                r{end+1} = a{i};
            end
            for j = 1:length(b)
                elem = obj.field.minus(obj.field,obj.field.zero,b{j}(1));
                b{j}(1) = elem;
                r{end+1} = b{j};
            end
            r = obj.consolidate(obj,r);
        end
            
        function r = prod(obj,a,b)
            r = {};
            for i=1:length(a)
                for j=1:length(b)
                    r{end + 1} = a{i};
                    r{end}(2:length(a{i})) = a{i}(2:length(a{i})) + b{j}(2:length(b{j}));
                    r{end}(1) = obj.field.prod(obj.field,a{i}(1),b{j}(1));
                end
            end
            r = obj.consolidate(obj,r);
        end
        
        function [quo,rem] = mon_quo(obj,dvd,dvs)
            quo = {zeros(1,length(dvd))};
            divisible = 1;
            for k = 2:length(dvd{1})
                quo{1}(k) = dvd{1}(k)-dvs{1}(k);
                if quo{1}(k) < 0
                    divisible = 0;
                    break;
                end
            end
            if divisible
                quo{1}(1) = obj.field.quo(obj.field,dvd{1}(1),dvs{1}(1));
                rem = obj.zero;
            else
                quo = obj.zero;
                rem = dvd;
            end
            quo = obj.consolidate(obj,quo);
            rem = obj.consolidate(obj,rem);
        end
        
        function max = lt(obj,f,order)
            max = f{1};
            for i = 2:length(f)
                if order(obj,max,f{i})
                    max = f{i};
                end
            end
            max = {max};
        end
        
        function less = lex_order(obj,t,q)
        s = t - q;
        less = 0;
        for i = 2:length(s)
            if s(i) < 0
                less = 1;
                return;
            elseif s(i) > 0
                return;
            end
        end
        end
        
        function less = lex_gr_order(obj,t,q)
            s1 = sum(t(2:length(t)));
            s2 = sum(q(2:length(q)));
            if s1 < s2
                less = 1;
            elseif s1 == s2
                less = obj.lex_order(obj,t,q);
            else
                less = 0;
            end
        end
        
        function less = lex_gr_r_order(obj,t,q)
            s1 = sum(t(2:length(t)));
            s2 = sum(q(2:length(q)));
            if s1 < s2
                less = 1;
            elseif s1 == s2
                s = t - q;
                less = 0;
                for i = length(s):-1:2
                    if s(i) > 0
                        less = 1;
                        return;
                    elseif s(i) < 0
                        return;
                    end
                end
            else 
                less = 0;
            end
        end
        
        function r = consolidate(obj,r)
            i = 1;
            while(i <= length(r))
                if isequal(r{i}(1),obj.field.zero) 
                    if length(r) == 1
                        r = obj.zero;
                    else
                        r(i)= [];
                        continue;
                    end
                end
                j = i+1;
                changed = 0;
                while j <= length(r)
                    if isequal(r{i}(2:length(r{i})),r{j}(2:length(r{j})))
                        r{i}(1) = obj.field.add(obj.field,r{i}(1),r{j}(1));
                        r(j) = [];
                        changed = 1;
                    else
                        j = j+1;
                    end
                end
                if ~changed
                    i = i+1;
                end
            end
        end
        
        function s = intshow(obj,f)
            s = "";
            for i = 1:length(f)
                    elem = f{i}(1);
                    degx = f{i}(2);
                    degy = f{i}(3);
                    if s ~= ""
                        s = strcat(s," + ");
                    end
                    if(degx == 0 && degy == 0)
                        s = strcat(s,string(elem));
                    elseif (degx == 0)
                        s = strcat(s,string(elem),"y^",string(degy));
                    elseif (degy == 0)
                        s = strcat(s,string(elem),"x^",string(degx));
                    else
                        s = strcat(s,string(elem),"x^",string(degx),...
                            "y^",string(degy) );
                    end
            end
        end
            
        function s = gfshow(obj,f)
            n = size(obj.field.field,2);
            s = "";
            if (n == 1) % Zp
                for i = 1:length(f)
                    elem = obj.field.gftrans(obj.field,f{i}(1));
                    degx = f{i}(2);
                    degy = f{i}(3);
                    if s ~= ""
                        s = strcat(s," + ");
                    end
                    if(degx == 0 && degy == 0)
                        s = strcat(s,string(elem));
                    elseif (degx == 0)
                        s = strcat(s,string(elem),"y^",string(degy));
                    elseif (degy == 0)
                        s = strcat(s,string(elem),"x^",string(degx));
                    else
                        s = strcat(s,string(elem),"x^",string(degx),...
                            "y^",string(degy) );
                    end
                end
            else % (Zp)^n
                for i = 1:length(f)
                    elem = obj.field.gftrans(obj.field,f{i}(1));
                    degx = f{i}(2);
                    degy = f{i}(3);
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

                    if s ~= ""
                        s = strcat(s," + ");
                    end
                    if(degx == 0 && degy == 0)
                        s = strcat(s,elemstr);
                    elseif (degx == 0)
                        s = strcat(s,elemstr,"y^",string(degy));
                    elseif (degy == 0)
                        s = strcat(s,elemstr,"x^",string(degx));
                    else
                        s = strcat(s,elemstr,"x^",string(degx),...
                            "y^",string(degy) );
                    end
                end
            end
        end
        
    end
end

