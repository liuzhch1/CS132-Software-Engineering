classdef FloorDoor < handle
    properties
        floor
        side
        state % true for open
        safe % true for nobody in the door
        dtime
    end
    
    methods
        function obj = FloorDoor(floor, side)
            obj.floor = floor;
            obj.state = false;
            obj.safe = true;
            obj.side = side;
            obj.dtime = 2;
        end
        
        function obj = open(obj)
            if obj.safe == true
                obj.state = true;
                obj.dtime = 2;
            end
        end
        
        function obj = close(obj)
            if obj.safe == ture
                obj.state = false;
            else
                error("people in the door")
            end
        end
    end
end

