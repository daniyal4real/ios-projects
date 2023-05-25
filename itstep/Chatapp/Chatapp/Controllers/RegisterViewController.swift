//
//  RegisterViewController.swift
//  Chatapp
//
//  Created by dan on 08.05.2023.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registrationButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        registrationButton.layer.cornerRadius = 8
        registrationButton.layer.masksToBounds = true
        registrationButton.tintColor = .systemGreen
        registrationButton.backgroundColor = .systemGreen
    }
    
    @IBAction func registrationButtonPressed(_ sender: Any) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print("User was not created", error!)
            } else {
                print("Created user")
                self.performSegue(withIdentifier: "registrationToChat", sender: self)
            }
        }
    }


}
