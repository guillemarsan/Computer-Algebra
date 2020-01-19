classdef FiniteFieldMultiPoly
    
    properties
        field
        zero
        one
    end
    
    methods
        
        function obj = FiniteFieldMultiPoly(F)
            obj.field = F;
            obj.zero = {[F.zero]};
            obj.one = {[F.one]};
        end
        
        function r = add(obj,a,b)
            r = {};
            for i=1:length(a)
                for j=1:length(b)
                    if isequal(a{i}(2:length(a{i})),b{j}(2:length(b{j})))
                        r{end + 1} = a{i};
                        r{end}(1) = obj.field.add(obj,a{i}(1),b{j}(1));
                        break;
                    end
                end
            end
        end
        
        function r = minus(obj,a,b)
            r = {};
            for i=1:length(a)
                for j=1:length(b)
                    if isequal(a{i}(2:length(a{i})),b{j}(2:length(b{j})))
                        r{end + 1} = a{i};
                        r{end}(1) = obj.field.minus(obj,a{i}(1),b{j}(1));
                        break;
                    end
                end
            end
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
            quo = zeros(length(dvd));
            divisible = 1;
            for k = 2:length(p)
                quo(k) = dvd(k)-dvs(k);
                if quo(k) < 0
                    divisible = 0;
                    break;
                end
            end
            if divisible
                quo(1) = obj.field.quo(obj.field,dvd(1),dvs(1));
                rem = ones(length(dvd)) * obj.field.zero;
            else
                quo = ones(length(dvd)) * obj.field.zero;
                rem = dvd;
            end
        end
        
        
        
        function r = consolidate(obj,r)
            for i=1:length(r)
                j = i+1;
                while j <= length(r)
                    if isequal(r{i}(2:length(r{i})),r{j}(2:length(r{j})))
                        r{i}(1) = obj.field.add(obj,r{i}(1),r{j}(1));
                        r(j) = [];
                    else
                        j = j+1;
                    end
                end
            end
        end
    end
end

