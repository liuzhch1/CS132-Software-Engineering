classdef ElevatorController < handle
    properties
        dir
        floor0, floor1, floor2, floor3
        fd_0l, fd_1l, fd_1r, fd_2l, fd_2r, fd_3l, fd_3r
        carL, carR
    end
    
    methods
        function obj = ElevatorController()
            obj.dir = 0;
            obj.floor0=Floor(0); obj.floor1=Floor(1); obj.floor2=Floor(2); obj.floor3=Floor(3);
            obj.fd_0l=FloorDoor(0,1); obj.fd_1l=FloorDoor(1,1); obj.fd_1r=FloorDoor(1,0); obj.fd_2l=FloorDoor(2,1); obj.fd_2r=FloorDoor(2,0); obj.fd_3l=FloorDoor(3,1); obj.fd_3r=FloorDoor(3,0);
            obj.carL=ElevatorCar(1); obj.carR=ElevatorCar(0);
        end
        function obj = openFDoor(obj, floor, side)
            switch side
                case 1
                    switch floor
                        case 0
                            obj.fd_0l.open();
                        case 1
                            obj.fd_1l.open();
                        case 2
                            obj.fd_2l.open();
                        case 3
                            obj.fd_3l.open();
                    end
                case 0
                    switch floor
                        case 1
                            obj.fd_1r.open();
                        case 2
                            obj.fd_2r.open();
                        case 3
                            obj.fd_3r.open();
                    end
            end
        end
        function obj = closeFDoor(obj, floor, side)
            switch side
                case 1
                    switch floor
                        case 0
                            obj.fd_0l.close();
                        case 1
                            obj.fd_1l.close();
                        case 2
                            obj.fd_2l.close();
                        case 3
                            obj.fd_3l.close();
                    end
                case 0
                    switch floor
                        case 1
                            obj.fd_1r.close();
                        case 2
                            obj.fd_2r.close();
                        case 3
                            obj.fd_3r.close();
                    end
            end
        end
        function obj = openDoor(obj, side) % open floor door and car door
            if side == 1
                obj.carL.oDoor();
                obj.openFDoor(obj.carL.state, 1);
            else
                obj.carR.oDoor();
                obj.openFDoor(obj.carR.state, 0);
            end
        end
        function obj = closeDoor(obj, side) % close floor door and car door
            if side == 1
                obj.carL.cDoor();
                obj.closeFDoor(obj.carR.state, 1);
            else
                obj.carR.cDoor();
                obj.closeFDoor(obj.carR.state, 0);
            end
        end
        function obj = move(obj, side, direction)
            switch side
                case 1
                    switch direction
                        case true
                            obj.carL.state = obj.carL.state + 0.25;
                        case false
                            obj.carL.state = obj.carL.state - 0.25;
                    end
                case 0
                    switch direction
                        case true
                            obj.carR.state = obj.carR.state + 0.25;
                        case false
                            obj.carR.state = obj.carR.state + 0.25;
                    end
            end
        end
        function obj = updateState(obj)
            
        end
    end
end