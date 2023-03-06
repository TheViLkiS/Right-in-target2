//
//  GameGenerator.swift
//  Right in target2
//
//  Created by Дмитрий Гусев on 20.10.2022.
//

import Foundation

protocol GeneratorProtocol {
    
    func getRandomValue() -> Int
}

class GameGenerator: GeneratorProtocol {
    var minNum: Int
    var maxNum: Int
    
    func getRandomValue () -> Int {
        (minNum...maxNum).randomElement()!
    }
    init?(startValue: Int, endValue: Int) {
        guard startValue <= endValue
        else {
            return nil
        }
        self.minNum = startValue
        self.maxNum = endValue
    }

}
