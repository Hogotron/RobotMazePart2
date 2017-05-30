//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(_ myRobot: ComplexRobotObject) {
      
        let robotIsBlocked = isFacingWall(myRobot, direction: myRobot.direction)
        print(robotIsBlocked)
        
        let myWallInfo = checkWalls(myRobot)
        print(myWallInfo)

        
        // Step 2.2a
        // Categorize the robot's current location based on the number of walls
        
        let isThreeWayJunction = myWallInfo.numberOfWalls == 1
        let isTwoWayPath = myWallInfo.numberOfWalls == 2
        let isDeadEnd = myWallInfo.numberOfWalls == 3

        // Step 2.2b
        
        if isThreeWayJunction == true {
            print("It's a three-way junction")
        } else if isTwoWayPath == true {
            print("It's a two-way path")
        } else if isDeadEnd == true {
            print("Dead end there, fucko!")
        }
        
        // Step 2.3a

        if isThreeWayJunction && robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
        } else if isThreeWayJunction && !robotIsBlocked {
            continueStraightOrRotate(myRobot)
        } else if isTwoWayPath && !robotIsBlocked {
            myRobot.move()
        } else if isTwoWayPath && robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
        } else if isDeadEnd {
            if !robotIsBlocked {
                myRobot.move()
            } else {
                myRobot.rotateRight()
            }
        }
    }

    
    func previousMoveIsFinished(_ robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
    }
}
