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
    end
end