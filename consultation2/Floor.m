classdef Floor
    properties
        floor
        upBotton
        dwBotton
    end
    
    methods
        function obj = Floor(num)
            obj.floor = num;
            if num == 0
                obj.upBotton = -1;
                obj.dwBotton = 0;
            elseif num == 3
                obj.upBotton = 0;
                obj.dwBotton = -1;
            else
                obj.upBotton = 0;
                obj.dwBotton = 0;
            end
        end
        
        function obj = press(obj, up)
            if up==1
                if obj.upBotton == -1
                    error("no upBotton");
                end
                obj.upBotton = 1;
            else
                if obj.dwBotton == -1
                    error("no downBotton")
                end
                obj.dwBotton = 1;
            end
        end
    end
end

