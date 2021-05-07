classdef ElevatorCar < handle
    properties
        side % 1 for left, 0 for right
        state % in which floor
        dState %true for open
        dSafe % true for nobody in the door
        time
    end
    
    methods
        function obj = ElevatorCar(side)
            obj.side = side;
            obj.state = 1;
            obj.dState = false;
            obj.dSafe = true;
            obj.time = 0;
        end
        
        function obj = move(obj, direction) %电梯花费4s穿过一层
            switch obj.time
                case 4 %到达新的一层
                    obj.time = 0;
                    if direction == ture
                        obj.state = obj.state + 1;
                    else
                        obj.state = obj.state - 1;
                    end
                case {1,2,3}
                    obj.time = obj.time +1;
            end
        end
    end
end

