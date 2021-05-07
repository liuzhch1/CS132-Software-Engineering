classdef FloorDoor < handle
    properties
        floor
        side
        state % true for open
        safe % true for nobody in the door
    end
    
    methods
        function obj = FloorDoor(floor, side)
            obj.floor = floor;
            obj.state = false;
            obj.safe = true;
            obj.side = side;
        end
        
        function obj = open(obj)
            obj.state = 1;
        end
        
        function obj = close(obj)
            obj.state = 0;
        end
    end
end

