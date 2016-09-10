//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        // Write your code here!
        
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 4, y: 4), isVertical: true)
        let smallShip = Ship(length: 2, location: GridLocation(x: 5, y: 5), isVertical: true)
        let largeShip = Ship(length: 4, location: GridLocation(x: 7, y: 0), isVertical: true)
        let extraLargeShip = Ship(length: 5, location: GridLocation(x: 1, y: 3), isVertical: false)
        
        human.addShipToGrid(smallShip)
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(largeShip)
        human.addShipToGrid(extraLargeShip)
        
        let mine1 = Mine(location: GridLocation(x: 2, y: 1), explosionText: "You Have hit a mine")
        let mine2 = Mine(location: GridLocation(x: 6, y: 7), explosionText: "BOOM")
        
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
        
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        let numberOfShips = 5
        let enemyShipSunk = numberOfShips - gameStats.enemyShipsRemaining
        let humanShipRemaining = numberOfShips - gameStats.humanShipsSunk
        let numberOfGuesses = gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman
        let sinkBonus = gameStats.sinkBonus
        let shipBonus = gameStats.shipBonus
        let guessPenalty = gameStats.guessPenalty
        print (sinkBonus)
        print (shipBonus)
        print (guessPenalty)

        
        
        finalScore = (enemyShipSunk * sinkBonus) + (humanShipRemaining * shipBonus) - (numberOfGuesses * guessPenalty)
        
        return finalScore
    }
}