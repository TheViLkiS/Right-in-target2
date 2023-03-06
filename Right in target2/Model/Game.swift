//
//  Game.swift
//  Right in target2
//
//  Created by Дмитрий Гусев on 19.10.2022.
//

import Foundation

protocol GameProtocol {
    
    var score: Int {get}
//    var currentSecretValue: Int {get}
    var isGameEnded: Bool {get}
    var currentRound: GameRoundProtocol {get}
    var secretValueGenerator: GeneratorProtocol {get}
    
    
    
    func restartGame()
    func startNewRound()
    
    
}

class Game: GameProtocol {
    
    var score: Int = 0
    var currentRound: GameRoundProtocol
    var secretValueGenerator: GeneratorProtocol
    
    var isGameEnded: Bool {
        if currentRound.numRound == 5 {
            return true
        } else {
            return false
        }
    }
    
    func restartGame() {
        currentRound.score = 0
        currentRound.numRound = 0
        startNewRound()
    }
    func startNewRound() {
        currentRound.currentSecretValue = secretValueGenerator.getRandomValue()
        currentRound.numRound += 1
    }
    init(secretValueGenerator: GeneratorProtocol, currentRound: GameRoundProtocol) {
        self.secretValueGenerator = secretValueGenerator
        self.currentRound = currentRound
    }
   
}



