//
//  SelectColorViewController.swift
//  Right in target2
//
//  Created by Дмитрий Гусев on 21.10.2022.
//

import UIKit

class SelectColorViewController: UIViewController {
    
    var selColClass = SelectColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selColClass.setColorButton(b1: &button1, b2: &button2, b3: &button3, b4: &button4, labelF: &label)
    }
    @IBAction func hideCurrentScene() {
        self.dismiss(animated: true)
    }
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var label: UILabel!
    
    private func showAlert(score: Int) {
        let notification = UIAlertController(title: "Игра закончена, повторим?", message: "Ваши очки - \(score)", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Да", style: .default)
        let action2 = UIAlertAction(title: "Нет", style: .cancel)
        notification.addAction(action1)
        notification.addAction(action2)
        present(notification, animated: true)
    }
    
    func checkAllButtons(a: Int) {
        if selColClass.checkButton(a: a) {
            showAlert(score: selColClass.score)
            selColClass.restart()
        }
        selColClass.setColorButton(b1: &button1, b2: &button2, b3: &button3, b4: &button4, labelF: &label)
    }
  
    @IBAction func checkColor1() {
        checkAllButtons(a: 0)
    }
    @IBAction func checkColor2() {
        checkAllButtons(a: 1)
    }
    @IBAction func checkColor3() {
        checkAllButtons(a: 2)
    }
    @IBAction func checkColor4() {
        checkAllButtons(a: 3)
    }
}

