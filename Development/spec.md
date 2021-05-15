algorithm: FCFS(first come first serve)

in any case, run in order that signals sent.

---

floorUI send signal

0: basement up button

1: floor 1 up button

-1: floor 1 dw button

2: floor 2 up button

-2: floor 2 dw button

-3: floor 3 dw button



3: left car go to basement

4: left car go to floor 1

5: left car go to floor 2

6: left car go to floor 3



-4: right car go to floor 1

-5: right car go to floor 2

-6: right car go to floor 3

```matlab
    if obj.LCprocessing == false
		obj.LCprocessing = true;
    	m = obj.msg(1);
    	obj.msg(1) = [];
		process(1, m);
		obj.LCprocessing = false;
	elseif obj.RCprocessing == false
    	obj.RCprocessing = true;
        m = obj.msg(1);
        obj.msg(1) = [];
        process(0, m);
        obj.RCprocessing = false;
	end
```

