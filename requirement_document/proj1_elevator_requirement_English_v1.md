# Elevator Requirement

## 1. Introduction

### 1.1 Purpose

Design a visualization system for dispatching two elevators (only one of which can reach the basement) in three floors and a basement

### 1.2 Scope

A system that allows elevators to be scheduled between floors according to passenger instructions

### 1.3 Definition 

Definition Definition Passenger: A person who uses an elevator

Car: A container for carrying passengers for movement in an elevator system

Sensor: Sensing various states to allow the controller to control for different states

Controller: The center of the elevator system where the various control instructions are given


## 2. Outline

### 2.1 Description

"Elevator scheduling system", including two types of interfaces (elevator interface, each floor interfaces), general UI, and control center. The system can dispatch the elevator car to meet the needs of passengers taking the elevator to different floor interfaces, while considering the efficiency

### 2.2 Functions

1. The user can be sent from the starting floor to the specified floor

2. The elevator floor information can be displayed in each floor interface and the elevator interface

3. The abnormal information of the elevator can be displayed in the interface of each floor and the elevator

4. The overweight information of the elevator can be displayed in the elevator interface

5. When passengers choose the direction of taking, one of the two electric cars can be automatically scheduled to arrive according to the principle of the highest overall efficiency

### 2.3 User Characteristics

Elevator users are basically ordinary people, their needs are only to use a simple image of the interface, let the elevator to send them to the designated floor. At the same time, elevator users are in pursuit of a efficiency, the elevator needs to be able to relatively quickly and efficiently reach the floor and transport to the designated floor.


### 2.4 User document
Will be displayed in User manul.


## 3. 外部接口需求

### 3.1 每个楼层界面的接口


### 3.2 电梯界面的接口


### 3.3 中控系统


## 4. 系统特性


### 4.1：Elevator Interface

	4.1.1:The elevator door can be controlled by a switch
	
		4.1.1.1：Elevator door can be delayed when pressing switch "open"

		4.1.1.2：The elevator door can be immediately closed when pressing switch "close"

	4.1.2：The elevator car can go to the designated floor when the corresponding floor button is pressed

		4.1.2.1：The elevator car can reach the first floor when the button "1" is pressed.
	
		4.1.2.2：The elevator car can reach the second floor when the button "2" is pressed.

		4.1.2.3：The elevator car can reach the third floor when the button "3" is pressed.

		4.1.2.4：The elevator car can reach the basement when the button "B" is pressed.

	4.1.3：The elevator can send a distress message to the console when the "help" button is pressed

	4.1.4:The display screen can correctly display the current correct state of the elevator

		4.1.4.1:The display displays the current floor of the elevator car

		4.1.4.2:Display can display overweight alert if overweight

		4.1.4.3:The display can show the exception status when the Help button is on time

### 4.2:Floor Interface

	4.2.1:The elevator car can be accessed by pressing buttons on the floor interface

		4.2.1.1:The elevator car can come when the UP button is pressed

		4.2.1.2:The elevator car can come when the Down button is pressed

	4.2.2：Floor interface can display  currently where the elevator car is 

### 4.3:Model

	4.3.1:The elevator car can move up and down at a certain speed

	4.3.2:The elevator car can stop on a specific floor

	4.3.3:The inner door of the elevator car can automatically open when reaching a certain floor

	4.3.4:The inner door of the elevator car can automatically close when opened for a period of time

	4.3.5:The outer door on each floor will open or close together with the inner doors

	4.3.6:The weight sensor detects the correct weight. if the elevator load is overweight, the sensor sends a message to the controller, stops the elevator, keeps the door open and displays the weight information on the screen


### 4.4:Controller

	4.4.1:The controller can receive information from other components

		4.4.1.1:The controller can receive information from the elevator interface

		4.4.1.2:The controller can receive information from the floor interface

		4.4.1.3:The controller can receive information from the overall model

	4.4.2:The controller can send messages to other components

		4.4.2.1:The controller can send messages to the elevator interface

		4.4.2.1:The controller can send messages to the floor interface

	4.4.3:The controller can send instructions to other components

		4.4.3.1:The controller can send commands to the elevator interface

		4.4.3.2:The controller can send commands to the floor interface

		4.4.3.2:The controller can send instructions to the overall model