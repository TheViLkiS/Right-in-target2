//
//  SelectColor.swift
//  Right in target2
//
//  Created by Дмитрий Гусев on 21.10.2022.
//

import Foundation
import UIKit


class SelectColor {
   
    var randomTuple = [(CGFloat, CGFloat, CGFloat)]()
    var randomLabel: (CGFloat, CGFloat, CGFloat)!
    var score = 0
    var round = 0
    
    func randomColor() -> UIColor {
        var x: CGFloat {
            CGFloat((0...255).randomElement()!)
        }
        let z = (x, x, x)
        randomTuple.append(z)
        return UIColor(red: z.0/255, green: z.1/255, blue: z.2/255, alpha: 1)
        
    }
    
    func toHex(a: (CGFloat, CGFloat, CGFloat)) -> String {
        var itog = ""
        itog.append(NSString(format:"%02X", Int(a.0)) as String)
        itog.append(NSString(format:"%02X", Int(a.1)) as String)
        itog.append(NSString(format:"%02X", Int(a.2)) as String)
        
        return "#" + itog
    }
    
    func setColorButton(b1: inout UIButton, b2: inout UIButton, b3: inout UIButton, b4: inout UIButton, labelF: inout UILabel) {
    randomTuple = []
    b1.backgroundColor = randomColor()
    b2.backgroundColor = randomColor()
    b3.backgroundColor = randomColor()
    b4.backgroundColor = randomColor()
    
    randomLabel = randomTuple.randomElement()
    labelF.text = toHex(a: randomLabel)
    }
    
    func checkButton (a: Int) -> Bool {
        if randomTuple[a] == randomLabel {
            score += 1
        }
        round += 1
        if round == 5 {
            return true
        }
        return false
    }

    func restart() {
        round = 0
        score = 0
    }

}



