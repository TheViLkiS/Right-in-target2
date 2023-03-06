//
//  GameRound.swift
//  Right in target2
//
//  Created by Дмитрий Гусев on 20.10.2022.
//

import Foundation

protocol GameRoundProtocol {
    
    var score: Int {get set}
    var currentSecretValue: Int! {get set}
    var numRound: Int {get set}
    func calculateScore(with: Int)
}

class GameRound: GameRoundProtocol {
    var score = 0
    var currentSecretValue: Int!
    var numRound = 0

    
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
}
