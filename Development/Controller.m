classdef Controller  < handle
    properties (Access = public)
        ModleUI
        FloorUI
        CarUIr
        CarUIl
        LCprocessing % IS LEFT CAR RUNNING?
        RCprocessing % IS RIGHT CAR RUNNING?
        msg % MESSAGE BOX FOR CACHE ORDERS
        t % TIMER
    end
    
    methods (Access = public)
        function obj = Controller()
            % DECLARE AND INITIALIZE ModelUI.mlapp, FloorUI{1,2,3,4}, CarUIl, CarUIr, LCprocessing, RCprocessing, msg
            % AND CONNCET THEM WITH CONTROLLER
            obj.ModleUI = modelUI;
            obj.ModleUI.controller = obj;
            obj.FloorUI{1} = floorUI();
            obj.FloorUI{1}.controller = obj;
            obj.FloorUI{2} = floorUI();
            obj.FloorUI{2}.controller = obj;
            obj.FloorUI{3} = floorUI();
            obj.FloorUI{3}.controller = obj;
            obj.FloorUI{4} = floorUI();
            obj.FloorUI{4}.controller = obj;
            obj.FloorUI{1}.create(1);
            obj.FloorUI{2}.create(2);
            obj.FloorUI{3}.create(3);
            obj.FloorUI{4}.create(-1);
            obj.CarUIl = carInUI();
            obj.CarUIr = carInUI();
            obj.CarUIl.create(1);
            obj.CarUIr.create(0);
            obj.CarUIl.controller = obj;
            obj.CarUIr.controller = obj;
            obj.LCprocessing = false;
            obj.RCprocessing = false;
            obj.msg = [];
            
            % INITIALIZE TIMER
            obj.t = timer;
            obj.t.Name = 'controllerTimer';
            obj.t.ExecutionMode = 'fixedRate';
            obj.t.Period = 1; % EVERY SECOND CHECK IF RIGHT/LEFT CAR CAN PROCESS ORDER
            obj.t.TimerFcn = @obj.MsgProcess;
            start(obj.t);
        end
        
        function MsgProcess(obj, ~,~)
            if size(obj.msg, 2) == 0 % NO ORDER, JUST RETURN
                return
            end
            if obj.RCprocessing == false % FIND THE FIRST ORDER THAT RIGHT CAR CAN PROCESS
                i = find(obj.msg<3 & obj.msg~=0 & obj.msg~=-1, 1);
                if size(i, 2) ~= 0 % EXIST SUCH ORDER
                    obj.RCprocessing = true; % RIGHT CAR START PROCESS
                    m = obj.msg(i);
                    obj.msg(i) = [];
                    obj.process(0, m(1));
                end
            end
            if obj.LCprocessing == false % FIND FOR LEFT CAR
                i = find(obj.msg>-4, 1);
                if size(i, 2) ~= 0 % EXIST SUCH CAR
                    obj.LCprocessing = true; % LEFT CAR START PROCESS
                    m = obj.msg(i);
                    obj.msg(i) = [];
                    obj.process(1, m(1));
                end
            end
        end
        
        function process(obj, side, m)
            if side == 1 % LEFT CAR PROCESS ORDER 0\1\-1\2\-2\-3\3\4\5\6
                switch m
                    case {0, 3}
                        obj.ModleUI.move(1, 0); % GO TO FLOOR -1
                    case {1, -1, 4}
                        obj.ModleUI.move(1, 1); % GO FLOOR 1
                    case {2, -2, 5}
                        obj.ModleUI.move(1, 2); % GO 2
                    case {-3, 6}
                        obj.ModleUI.move(1, 3); % GO 3
                end
            else % RIGHT CAR PROCESS ORDER 1\2\-2\-3\-4\-5\-6
                switch m
                    case {1, -4}
                        obj.ModleUI.move(0, 1);
                    case {2, -2, -5}
                        obj.ModleUI.move(0, 2);
                    case {-3, -6}
                        obj.ModleUI.move(0, 3);
                end
            end
            switch m % CHANGE THE BUTTON STATE
                case 0
                    obj.FloorUI{4}.upButton.Value = false;
                case 1
                    obj.FloorUI{1}.upButton.Value = false;
                case -1
                    obj.FloorUI{1}.dwButton.Value = false;
                case 2
                    obj.FloorUI{2}.upButton.Value = false;
                case -2
                    obj.FloorUI{2}.dwButton.Value = false;
                case -3
                    obj.FloorUI{3}.dwButton.Value = false;
            end
        end
        
        function updateDisp(obj) % UPDATE UI INFO DISPLAY
            LF = round(obj.ModleUI.cH/3+1); % COMPUTE LEFT CAT'FLOOR
            if LF == 0
                LF = '-1';
            else
                LF = string(LF);
            end
            RF = string(round(obj.ModleUI.dH/3+1));
            obj.FloorUI{1}.LeftFloor.Value = LF;
            obj.FloorUI{2}.LeftFloor.Value = LF;
            obj.FloorUI{3}.LeftFloor.Value = LF;
            obj.FloorUI{4}.LeftFloor.Value = LF;
            obj.CarUIl.Display.Value = LF;
            obj.FloorUI{1}.RightFloor.Value = RF;
            obj.FloorUI{2}.RightFloor.Value = RF;
            obj.FloorUI{3}.RightFloor.Value = RF;
            obj.CarUIr.Display.Value = RF;
        end
        
        function moveDoor(obj, floor, side, open)
            if floor == -1 || floor == 0 % BASEMENT MAY HAVE TWO WAY TO PRESENT: -1\0
                obj.FloorUI{4}.moveDoor(side, open);
            else
                obj.FloorUI{floor}.moveDoor(side, open);
            end
        end
    end
end