//
//  ViewController.swift
//  calculator
//
//  Created by dan on 13.04.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var firstNumber: UITextField!
    @IBOutlet weak var secondNumber: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    
    
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var nameButton: UIButton!
//    var status = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plusButton.setTitleColor(.green, for: .normal)
    }
    
    
    @IBAction func plusPressed(_ sender: Any) {
        let number1: Int? = Int(firstNumber.text!)
        let number2: Int? = Int(secondNumber.text!)
        
        let result: Int? = number1! + number2!
        resultLabel.text = String(result!)
    }
    
        // ставим фото звезды
//        nameButton.setImage(UIImage(systemName: "star"), for: .normal)
//    }

    
    
//    @IBAction func buttonPressed(_ sender: Any) {
//        if status == false {
////            nameLabel.text = "Pressed"
//            nameButton.tintColor = .gray
//            status = true
//            return
//        }
////        nameLabel.text = "Калькулятор"
//        nameButton.tintColor = .systemBlue
//        status = false
//    }
}

