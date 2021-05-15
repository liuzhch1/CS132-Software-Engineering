classdef ElevatorCar < handle
    properties
        run
        side % 1 for left, 0 for right
        state % in which floor
        dState %true for open
        dSafe % true for nobody in the door
        time
        dtime
    end
    
    methods
        function obj = ElevatorCar(side)
            obj.run = false;
            obj.side = side;
            obj.state = 1.0;
            obj.dState = false;
            obj.dSafe = true;
            obj.time = 0;
            obj.dtime = 2;
        end
        
        function obj = cDoor(obj)
            if obj.dSafe == true
                obj.dState = false;
            else
                error("people in the door");
            end
        end
        function obj = oDoor(obj)
            if obj.run == false && obj.dSafe == true
                obj.dState = true;
                obj.dtime = 2;
            end
        end
    end
end

