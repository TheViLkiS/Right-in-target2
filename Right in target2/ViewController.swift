//
//  ViewController.swift
//  Right in target2
//
//  Created by Дмитрий Гусев on 13.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Game!
    var roundGameme = GameRound()
    var generatorGameme = GameGenerator(startValue: 1, endValue: 50)
   
  // MARK: Жизненный цикл

    override func viewDidLoad() {
        super.viewDidLoad()

        game = Game(secretValueGenerator: generatorGameme!, currentRound: roundGameme)
        game.startNewRound()
        
        updateTextLabel(newText: roundGameme.currentSecretValue)
        }
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    
    @IBAction func checkNumber() {
       
        if game.isGameEnded == true {
            showAlert(score: game.score)
            game.restartGame()
        } else {
            roundGameme.calculateScore(with: Int(slider.value))
            game.startNewRound()
        }
        
        updateTextLabel(newText: roundGameme.currentSecretValue)
    }
    
    // MARK: Функции
    private func updateTextLabel(newText: Int) {
        label.text = "Поставь слайдер на число \(newText)"
    }

    private func showAlert(score: Int) {
        let notification = UIAlertController(title: "Игра окончена, повторим?", message: "Ваш результат - \(roundGameme.score)", preferredStyle: .alert)
        let notification1 = UIAlertAction(title: "Да", style: .default)
        let notification2 = UIAlertAction(title: "Нет", style: .cancel)
    notification.addAction(notification1)
    notification.addAction(notification2)
        present(notification, animated: true)
    }
    @IBAction func hideCurrentScene() {
        self.dismiss(animated: true)
    }

}
