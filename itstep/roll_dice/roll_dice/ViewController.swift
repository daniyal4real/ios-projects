//
//  ViewController.swift
//  roll_dice
//
//  Created by dan on 20.04.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var firstDice: UIImageView!
    @IBOutlet weak var secondDice: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    
    let diceNames = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func rollPressed(_ sender: Any) {
        let dice1: Int = Int(arc4random()) % 6
        let dice2: Int = Int(arc4random()) % 6
        
        firstDice.image = UIImage(named: diceNames[dice1])
        secondDice.image = UIImage(named: diceNames[dice2])
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            rollPressed(rollButton!)
        }
    }
    
}

